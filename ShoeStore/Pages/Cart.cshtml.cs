/*using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ShoeStore.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Infrastructure;
using ShoeStore.Models;
using ShoeStore.Models.ViewModels;
using ShoeStore.Ultitity;

namespace ShoeStore.Pages;

public class CartModel : PageModel
{
    private readonly IUnitOfWork _unitOfWork;
    public Cart Cart { get; set; }
    public string ReturnUrl { get; set; } = "/";
    [BindProperty] public CartViewModel CartViewModel { get; set; }

    public CartModel(Cart cartService, IUnitOfWork unitOfWork)
    {
        Cart = cartService;
        _unitOfWork = unitOfWork;
    }


    public async Task OnGet(string? returnUrl)
    {
        ReturnUrl = returnUrl ?? "/";

        CartViewModel = new CartViewModel()
        {
            ReturnUrl = ReturnUrl
        };

        ClaimsIdentity? claimsIdentity = (ClaimsIdentity?)User.Identity;
        Claim? claim = claimsIdentity?.FindFirst(ClaimTypes.NameIdentifier);
        string? applicationUserId = claim?.Value;

        var cartItems = await _unitOfWork.CartItems.GetAllAsync(e => e.ApplicationUserId == applicationUserId);

        foreach (var cartItem in cartItems)
        {
            ShoeSize? shoeSize = await _unitOfWork.ShoeSizes
                .FirstOrDefaultAsync(e => e.Id == cartItem.ShoeSizeId,
                    include: o => o.Include(e => e.Size)
                        .Include(e => e.ShoeColor)
                        .ThenInclude(e => e.Images)
                        .Include(e => e.ShoeColor)
                        .ThenInclude(e => e.Shoe)
                        .ThenInclude(e => e.Brand));

            if (shoeSize != null)
            {
                CartViewModel.ProductCartsList.Add(
                    new ProductCartViewModel()
                    {
                        ShoeSizeId = shoeSize.Id,
                        ProductName =
                            $"{shoeSize.ShoeColor.Shoe.Name}  (size: {shoeSize.Size.Unit} {shoeSize.Size.Value})",
                        BrandName = shoeSize.ShoeColor.Shoe.Brand.Name,
                        Price = shoeSize.ShoeColor.SalePrice,
                        Quantity = cartItem.Count,
                        ImgPath = shoeSize.ShoeColor.Images?.First().Path,
                        ProductUrl = shoeSize.ShoeColor.Url
                    }
                );
            }
        }
    }
    // public async Task OnGet(string? returnUrl)
    // {
    //     ReturnUrl = returnUrl ?? "/";
    //     // Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
    //     CartViewModel = new CartViewModel()
    //     {
    //         ReturnUrl = ReturnUrl
    //     };
    //     
    //     foreach (var line in Cart.CartItemsList)
    //     {
    //         ShoeSize? shoeSize = await _unitOfWork.ShoeSizes
    //             .FirstOrDefaultAsync(e => e.Id == line.ShoeSizeId,
    //                 include: o => o.Include(e => e.Size)
    //                     .Include(e => e.ShoeColor)
    //                     .ThenInclude(e => e.Images)
    //                     .Include(e => e.ShoeColor)
    //                     .ThenInclude(e => e.Shoe)
    //                     .ThenInclude(e => e.Brand));
    //
    //         if (shoeSize != null)
    //         {
    //             CartViewModel.ProductCartsList.Add(
    //                 new ProductCartViewModel()
    //                 {
    //                     ShoeSizeId = shoeSize.Id,
    //                     ProductName =
    //                         $"{shoeSize.ShoeColor.Shoe.Name}  (size: {shoeSize.Size.Unit} {shoeSize.Size.Value})",
    //                     BrandName = shoeSize.ShoeColor.Shoe.Brand.Name,
    //                     Price = shoeSize.ShoeColor.SalePrice,
    //                     Quantity = line.Count,
    //                     ImgPath = shoeSize.ShoeColor.Images?.First().Path,
    //                     ProductUrl = shoeSize.ShoeColor.Url
    //                 }
    //             );
    //         }
    //     }
    // }

    public async Task<IActionResult> OnPost(CartItem cartItem, string returnUrl)
    {
        if (ModelState.IsValid)
        {
            ClaimsIdentity? claimsIdentity = (ClaimsIdentity?)User.Identity;
            Claim? claim = claimsIdentity?.FindFirst(ClaimTypes.NameIdentifier);
            string? applicationUserId = claim?.Value;
        
            cartItem.ApplicationUserId = applicationUserId;

            ShoeSize? shoeSize = await _unitOfWork.ShoeSizes
                .FirstOrDefaultAsync(e => e.Id == cartItem.ShoeSizeId);

            if (shoeSize != null)
            {
                CartItem? cartItemFromDb = (await _unitOfWork.CartItems.FirstOrDefaultAsync(e =>
                    e.ApplicationUserId == applicationUserId && e.ShoeSizeId == cartItem.ShoeSizeId));

                if (cartItemFromDb != null)
                {
                    cartItem.Id = cartItemFromDb.Id;
                
                    cartItem.Count += cartItemFromDb.Count;
                    if (cartItem.Count > shoeSize.Quantity)
                    {
                        cartItem.Count = shoeSize.Quantity;
                    }

                    _unitOfWork.CartItems.Update(cartItem);
                }
                else
                {
                    await _unitOfWork.CartItems.AddAsync(cartItem);
                }
            
                await _unitOfWork.SaveChangesAsync();
            }

            TempData[SD.Success] = "Added to Cart";
            return RedirectToPage(new { returnUrl });
        }
        
        TempData[SD.Error] = "Some things is wrong!";

        return Redirect(returnUrl);
    }
    // public async Task<IActionResult> OnPost(int ShoeSizeId, string returnUrl, int Count = 1)
    // {
    //     ShoeSize? shoeSize = await _context.ShoeSize
    //         .FirstOrDefaultAsync(e => e.Id == ShoeSizeId);
    //
    //     if (shoeSize != null)
    //     {
    //         // Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
    //         Cart.AddItem(ShoeSizeId, Count > 0 ? Count : 1);
    //         CartItem? line = Cart.CartItemsList
    //             .FirstOrDefault(p => p.ShoeSizeId == ShoeSizeId);
    //         if (line.Count > shoeSize.Quantity)
    //         {
    //             line.Count = shoeSize.Quantity;
    //         }
    //
    //         HttpContext.Session.SetJson("cart", Cart);
    //     }
    //
    //     return RedirectToPage(new { returnUrl = returnUrl });
    // }

    public async Task<IActionResult> OnPostSubtractAsync(int productId, string returnUrl)
    {
        // Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
        Cart.SubtractItem(productId, 1);
        HttpContext.Session.SetJson("cart", Cart);

        return RedirectToPage(new { returnUrl = returnUrl });
    }

    public async Task<IActionResult> OnPostDeleteAsync(int productId, string returnUrl)
    {
        // Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
        Cart.RemoveLine(productId);
        HttpContext.Session.SetJson("cart", Cart);

        return RedirectToPage(new { returnUrl = returnUrl });
    }
}*/