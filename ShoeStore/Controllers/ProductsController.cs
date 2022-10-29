using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Models.ViewModels;
using ShoeStore.Ultitity;

namespace ShoeStore.Controllers;

public class ProductsController : Controller
{
    private readonly IUnitOfWork _unitOfWork;

    public int PageSize = 9;
    public Cart Cart { get; set; }

    // GET
    public ProductsController(IUnitOfWork unitOfWork, Cart cart)
    {
        _unitOfWork = unitOfWork;
        Cart = cart;
    }

    public async Task<IActionResult> Index(string? productName, int page = 1, string? brand = null, int? size = null,
        decimal? minPrice = 0,
        decimal? maxPrice = 999, string? sort = "latest")
    {
        ProductListViewModel productListViewModel = await _unitOfWork.ShoeColors.FilterProductAsync(PageSize,
            productName, page, brand, size, minPrice, maxPrice,
            sort);
        return View(productListViewModel);
    }

    [HttpGet]
    public async Task<IActionResult> Detail(string url)
    {
        ShoeColor? shoeColor = await _unitOfWork.ShoeColors
                .FirstOrDefaultAsync(e => e.Url == url,
                    include: o => o
                        .Include(e => e.Images)
                        .Include(e => e.ShoeSizes)!
                        .ThenInclude(e => e.Size)!
                )
            ;
        if (shoeColor == null)
        {
            return NotFound();
        }

        Shoe shoe = await _unitOfWork.Shoes
            .FirstOrDefaultAsync(e => e.ShoeColors!.Any(e => e.Id == shoeColor.Id),
                include: o => o
                    .Include(e => e.Brand)
                    .Include(e => e.ShoeColors)!
                    .ThenInclude(e => e.Color)
                    .Include(e => e.ShoeColors)!
                    .ThenInclude(e => e.Images)!
            );

        List<ShoeColor> relatedShoeColors = shoe.ShoeColors!.OrderBy(e => e.SortOrder).ToList();

        IEnumerable<ShoeColor> relatedShoes = await _unitOfWork.ShoeColors
            .GetAllAsync(e => e.Shoe.Brand.Id == shoe.Brand.Id && e.Id != shoeColor.Id,
                include: o => o
                    .Include(e => e.Images)
                    .Include(e => e.Shoe.Brand),
                orderBy: e => e.Priority,
                take: 4
            );

        ProductDetailViewModel productDetailViewModel = new ProductDetailViewModel
        {
            Shoe = shoe,
            ShoeColor = shoeColor,
            ShoeImages = shoeColor.Images,
            ShoeSizes = shoeColor.ShoeSizes,
            RelatedProduct = relatedShoes,
            RelatedShoeColors = relatedShoeColors
        };
        return View(productDetailViewModel);
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult>
        AddToCart(CartItem cartItem, string? returnUrl)
    {
        returnUrl ??= "/";

        if (ModelState.IsValid)
        {
            ClaimsIdentity? claimsIdentity = (ClaimsIdentity?)User.Identity;
            Claim? claim = claimsIdentity?.FindFirst(ClaimTypes.NameIdentifier);
            string? applicationUserId = claim?.Value;

            if (applicationUserId != null)
            {
                cartItem.ApplicationUserId = applicationUserId;

                ShoeSize? shoeSize = await _unitOfWork.ShoeSizes
                    .FirstOrDefaultAsync(e => e.Id == cartItem.ShoeSizeId,
                        include: e => e.Include(e => e.ShoeColor));

                if (shoeSize == null)
                {
                    return NotFound();
                }
                
                if (shoeSize.Quantity == 0)
                {
                    TempData[SD.Error] = "This size is out of stock!";
                    return Redirect(returnUrl);
                }

                if (shoeSize.Quantity < cartItem.Count)
                {
                    TempData[SD.Error] = $"There're only {shoeSize.Quantity} items of this size left";
                    return Redirect(returnUrl);
                }

                cartItem.PriceEach = shoeSize.ShoeColor.SalePrice;

                CartItem? cartItemFromDb = (await _unitOfWork.CartItems.FirstOrDefaultAsync(e =>
                    e.ApplicationUserId == applicationUserId && e.ShoeSizeId == cartItem.ShoeSizeId));

                if (cartItemFromDb == null)
                {
                    await _unitOfWork.CartItems.AddAsync(cartItem);
                }
                else
                {
                    cartItem.Id = cartItemFromDb.Id;

                    int newCount = cartItem.Count + cartItemFromDb.Count;
                    
                    if (newCount > shoeSize.Quantity)
                    {
                        int diff = shoeSize.Quantity - cartItemFromDb.Count;

                        TempData[SD.Error] = diff == 0
                            ? "Can't add more items of this size to Cart!"
                            : $"You can only add {diff} more items of this size to Cart";

                        return Redirect(returnUrl);
                    }

                    cartItem.Count = newCount;
                    _unitOfWork.CartItems.Update(cartItem);
                }

                await _unitOfWork.SaveChangesAsync();

                return RedirectToAction("Index", "Cart", new { returnUrl });
            }
        }

        TempData[SD.Error] = "Did you forgot to chose size?";

        return Redirect(returnUrl);
    }

    [HttpPost]
    [AllowAnonymous]
    public async Task<IActionResult>
        AddToCartSession(CartItem cartItem, string? returnUrl)
    {
        returnUrl ??= "/";

        if (ModelState.IsValid)
        {
            ShoeSize? shoeSize = await _unitOfWork.ShoeSizes
                .FirstOrDefaultAsync(e => e.Id == cartItem.ShoeSizeId,
                    include: e => e.Include(e => e.ShoeColor));

            if (shoeSize == null)
            {
                return NotFound();
            }

            if (shoeSize.Quantity == 0)
            {
                TempData[SD.Error] = "This size is out of stock!";
                return Redirect(returnUrl);
            }

            if (shoeSize.Quantity < cartItem.Count)
            {
                TempData[SD.Error] = $"There're only {shoeSize.Quantity} items of this size left!";
                return Redirect(returnUrl);
            }

            cartItem.PriceEach = shoeSize.ShoeColor.SalePrice;

            CartItem? cartItemFromSession = Cart.CartItemsList.FirstOrDefault(e => e.ShoeSizeId == cartItem.ShoeSizeId);

            if (cartItemFromSession == null)
            {
                Cart.AddItem(shoeSize.Id, cartItem.Count);
            }
            else
            {
                cartItem.Id = cartItemFromSession.Id;

                int newCount = cartItem.Count + cartItemFromSession.Count;

                if (newCount > shoeSize.Quantity)
                {
                    int diff = shoeSize.Quantity - cartItemFromSession.Count;

                    TempData[SD.Error] = diff == 0
                        ? "Can't add more items of this size to Cart!"
                        : $"You can only add {diff} more items of this size to Cart";

                    return Redirect(returnUrl);
                }

                Cart.AddItem(shoeSize.Id, cartItem.Count);
            }
            return RedirectToAction("Index", "Cart", new { returnUrl });
        }

        TempData[SD.Error] = "Did you forgot to chose size?";

        return Redirect(returnUrl);
    }
}