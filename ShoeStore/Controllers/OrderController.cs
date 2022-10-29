using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Models.ViewModels;
using ShoeStore.Ultitity;
using Stripe;
using Stripe.Checkout;

namespace ShoeStore.Controllers;

public class OrderController : Controller
{
    private readonly IUnitOfWork _unitOfWork;

    public OrderController(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IActionResult> Index(string? status, string? phoneNumber)
    {
        IEnumerable<ShopOrder> orders;

        if (User.IsInRole(SD.Role_Admin) || User.IsInRole(SD.Role_Employee))
        {
            orders = await _unitOfWork.Orders
                .GetAllAsync(include: e =>
                    e.Include(e => e.ApplicationUser));
        }
        else
        {
            ClaimsIdentity? claimsIdentity = (ClaimsIdentity?)User.Identity;
            Claim? claim = claimsIdentity?.FindFirst(ClaimTypes.NameIdentifier);
            string? applicationUserId = claim?.Value;

            if (applicationUserId != null)
            {
                orders = await _unitOfWork.Orders
                    .GetAllAsync(e => e.ApplicationUserId == applicationUserId,
                        include: e =>
                            e.Include(e => e.ApplicationUser));
            }
            else if (phoneNumber == null)
            {
                return RedirectToAction("SearchOrder");
            }
            else
            {
                orders = await _unitOfWork.Orders.GetAllAsync(e => e.PhoneNumber == phoneNumber,
                    include: e =>
                        e.Include(e => e.ApplicationUser));
            }
        }

        switch (status)
        {
            case "pending":
                orders = orders.Where(e => e.PaymentStatus == SD.PaymentStatusDelayedPayment);
                break;
            case "inprocess":
                orders = orders.Where(e => e.OrderStatus == SD.StatusInpProcess);
                break;
            case "completed":
                orders = orders.Where(e => e.OrderStatus == SD.StatusShipped);
                break;
            case "approved":
                orders = orders.Where(e => e.OrderStatus == SD.StatusApproved);
                break;
            case "all":
                break;
        }

        return View(orders);
    }

    public IActionResult SearchOrder()
    {
        return View();
    }

    public async Task<IActionResult> Details(int id)
    {
        ShopOrder? orderFromDb = await _unitOfWork.Orders.FirstOrDefaultAsync(e => e.Id == id,
            include: o => o.Include(e => e.ApplicationUser));
        if (orderFromDb == null)
        {
            return NotFound();
        }

        OrderViewModel orderViewModel = new OrderViewModel()
        {
            Order = orderFromDb,
            OrderDetails = await _unitOfWork.OrderDetails.GetAllAsync(e => e.OrderId == id,
                include: o => o
                    .Include(e => e.ShoeSize)
                    .ThenInclude(e => e.ShoeColor)
                    .ThenInclude(e => e.Shoe)
                    .Include(e => e.ShoeSize)
                    .ThenInclude(e => e.ShoeColor)
                    .ThenInclude(e => e.Color)!
            )
        };

        return View(orderViewModel);
    }

    [ActionName(nameof(Details))]
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Details_PAY_NOW(OrderViewModel orderViewModel)
    {
        ShopOrder? orderFromDb = await _unitOfWork.Orders.FirstOrDefaultAsync(
            e => orderViewModel.Order != null && e.Id == orderViewModel.Order.Id,
            include: o => o.Include(e => e.ApplicationUser));
        if (orderFromDb == null)
        {
            return NotFound();
        }

        orderViewModel.Order = orderFromDb;

        orderViewModel.OrderDetails = await _unitOfWork.OrderDetails.GetAllAsync(e => e.OrderId == orderFromDb.Id,
            include: o => o.Include(e => e.ShoeSize));

        //--------
        // stripe settings
        var domain = $"{Request.Scheme}://{Request.Host.Value}";
        // var options = new SessionCreateOptions
        var options = new SessionCreateOptions
        {
            LineItems = new List<SessionLineItemOptions>(),
            Mode = "payment",
            SuccessUrl = $"{domain}/Cart/PaymentConfirmation?id={orderViewModel.Order.Id}",
            CancelUrl = $"{domain}/Order/Details?id={orderViewModel.Order.Id}",
            PaymentMethodTypes = new List<string>()
            {
                "card",
            },
        };

        foreach (var orderDetail in orderFromDb.OrderDetails)
        {
            ShoeColor shoeColor = (await _unitOfWork.ShoeColors.FirstOrDefaultAsync(
                e => e.ShoeSizes!.Any(ss => ss.Id == orderDetail.ShoeSizeId),
                include: o => o.Include(e => e.Shoe)
                    .Include(e => e.Images)!
                    .Include(e => e.Color)!
            ))!;

            var s = shoeColor?.Images?.Select(e => Url.Content(e.Path)).ToList() ?? new List<string>();

            var sessionLineItem = new SessionLineItemOptions
            {
                PriceData = new SessionLineItemPriceDataOptions
                {
                    UnitAmount = (long)(orderDetail.PriceEach * 100),
                    Currency = "usd",
                    ProductData = new SessionLineItemPriceDataProductDataOptions
                    {
                        Name = $"{shoeColor.Shoe.Name} {shoeColor.Color?.Name}",
                        Images = shoeColor?.Images?.Select(e => $"{domain}{e.Path}").ToList() ?? new List<string>(),
                    },
                },
                Quantity = orderDetail.Count,
            };

            options.LineItems.Add(sessionLineItem);
        }

        var service = new SessionService();
        Session session = service.Create(options);

        await _unitOfWork.Orders.UpdateStripePaymentId(orderViewModel.Order.Id, session.Id, session.PaymentIntentId);
        await _unitOfWork.SaveChangesAsync();

        Response.Headers.Add("Location", session.Url);
        return new StatusCodeResult(303);
        //--------
    }

    public async Task<IActionResult> PaymentConfirmation(int id)
    {
        ShopOrder? order = await _unitOfWork.Orders.FirstOrDefaultAsync(e => e.Id == id);

        if (order == null)
        {
            return NotFound();
        }

        if (order.PaymentStatus == SD.PaymentStatusDelayedPayment)
        {
            var service = new SessionService();
            Session session = service.Get(order.SessionId);
            // check the stripe status
            if (session.PaymentStatus.ToLower() == "paid")
            {
                await _unitOfWork.Orders.UpdateStatusAsync(id, order.OrderStatus, SD.PaymentStatusApproved);
                await _unitOfWork.SaveChangesAsync();
            }
        }

        return View(id);
    }


    [HttpPost]
    [ValidateAntiForgeryToken]
    [Authorize(Roles = $"{SD.Role_Admin},{SD.Role_Employee}")]
    public async Task<IActionResult> UpdateOrderDetail(OrderViewModel orderViewModel)
    {
        ShopOrder? orderFromDb = await _unitOfWork.Orders.FirstOrDefaultAsync(
            e => orderViewModel.Order != null && e.Id == orderViewModel.Order.Id,
            include: o => o.Include(e => e.ApplicationUser));
        if (orderFromDb == null)
        {
            return NotFound();
        }

        if (orderViewModel.Order != null)
        {
            orderFromDb.Name = orderViewModel.Order.Name;
            orderFromDb.PhoneNumber = orderViewModel.Order.PhoneNumber;
            orderFromDb.Address = orderViewModel.Order.Address;
            orderFromDb.City = orderViewModel.Order.City;
            orderFromDb.District = orderViewModel.Order.District;
            orderFromDb.Ward = orderViewModel.Order.Ward;
            orderFromDb.PostalCode = orderViewModel.Order.PostalCode;

            if (orderViewModel.Order.Carrier != null)
            {
                orderFromDb.Carrier = orderViewModel.Order.Carrier;
            }

            if (orderViewModel.Order.TrackingNumber != null)
            {
                orderFromDb.TrackingNumber = orderViewModel.Order.TrackingNumber;
            }
        }

        _unitOfWork.Orders.Update(orderFromDb);
        await _unitOfWork.SaveChangesAsync();
        TempData[SD.Success] = "Order Details Updated Successfully!";

        return RedirectToAction("Details", "Order", new { id = orderFromDb.Id });
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    [Authorize(Roles = $"{SD.Role_Admin},{SD.Role_Employee}")]
    public async Task<IActionResult> StartProcessing(OrderViewModel orderViewModel)
    {
        ShopOrder? orderFromDb = await _unitOfWork.Orders.FirstOrDefaultAsync(
            e => orderViewModel.Order != null && e.Id == orderViewModel.Order.Id,
            include: o => o.Include(e => e.ApplicationUser));

        if (orderFromDb == null)
        {
            return NotFound();
        }

        await _unitOfWork.Orders.UpdateStatusAsync(orderFromDb.Id, SD.StatusInpProcess);
        await _unitOfWork.SaveChangesAsync();
        TempData[SD.Success] = "Order Status Updated Successfully!";

        return RedirectToAction("Details", "Order", new { id = orderFromDb.Id });
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    [Authorize(Roles = $"{SD.Role_Admin},{SD.Role_Employee}")]
    public async Task<IActionResult> ShipOrder(OrderViewModel orderViewModel)
    {
        ShopOrder? orderFromDb = await _unitOfWork.Orders.FirstOrDefaultAsync(
            e => orderViewModel.Order != null && e.Id == orderViewModel.Order.Id,
            include: o => o.Include(e => e.ApplicationUser));

        if (orderFromDb == null)
        {
            return NotFound();
        }

        if (orderViewModel.Order != null)
        {
            orderFromDb.ShippingDate = DateTime.Now;
            orderFromDb.OrderStatus = SD.StatusShipped;
            orderFromDb.TrackingNumber = orderViewModel.Order.TrackingNumber;
            orderFromDb.Carrier = orderViewModel.Order.Carrier;
            if (orderFromDb.PaymentStatus == SD.PaymentStatusDelayedPayment)
            {
                orderFromDb.PaymentDueDate = DateTime.Now.AddDays(30);
            }
        }

        _unitOfWork.Orders.Update(orderFromDb);
        await _unitOfWork.SaveChangesAsync();
        TempData[SD.Success] = "Order Shipped Successfully!";

        return RedirectToAction("Details", "Order", new { id = orderFromDb.Id });
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    [Authorize(Roles = $"{SD.Role_Admin},{SD.Role_Employee}")]
    public async Task<IActionResult> CancelOrder(OrderViewModel orderViewModel)
    {
        ShopOrder? orderFromDb = await _unitOfWork.Orders.FirstOrDefaultAsync(
            e => orderViewModel.Order != null && e.Id == orderViewModel.Order.Id,
            include: o => o.Include(e => e.ApplicationUser));

        if (orderFromDb == null)
        {
            return NotFound();
        }

        // begin transaction
        var transaction = await _unitOfWork.BeginTransactionAsync();

        List<OrderDetail> orderDetails = await _unitOfWork.OrderDetails.GetAllAsync(e => e.OrderId == orderFromDb.Id);

        foreach (var orderDetail in orderDetails)
        {
            ShoeSize? shoeSize =
                await _unitOfWork.ShoeSizes.FirstOrDefaultAsync(e => e.Id == orderDetail.ShoeSizeId);
            if (shoeSize == null)
            {
                throw new Exception("ShoeSize does not exist!");
            }

            shoeSize.Quantity += orderDetail.Count;
            _unitOfWork.ShoeSizes.Update(shoeSize);
        }

        if (orderFromDb.PaymentStatus == SD.PaymentStatusApproved)
        {
            var options = new RefundCreateOptions()
            {
                Reason = RefundReasons.RequestedByCustomer,
                PaymentIntent = orderFromDb.PaymentIntentId,
            };

            var service = new RefundService();
            Refund refund = await service.CreateAsync(options);

            await _unitOfWork.Orders.UpdateStatusAsync(orderFromDb.Id, SD.StatusCancelled, SD.StatusRefunded);
        }
        else
        {
            await _unitOfWork.Orders.UpdateStatusAsync(orderFromDb.Id, SD.StatusCancelled, SD.StatusCancelled);
        }

        await _unitOfWork.SaveChangesAsync();

        await transaction.CommitAsync();
        // end Transaction

        TempData[SD.Success] = "Order Canceled Successfully!";

        return RedirectToAction("Details", "Order", new { id = orderFromDb.Id });
    }
}