using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.Components;

public class CartButtonViewComponent : ViewComponent
{
    private readonly IUnitOfWork _unitOfWork;
    public CartButtonViewComponent(Cart cart, IUnitOfWork unitOfWork)
    {
        Cart = cart;
        _unitOfWork = unitOfWork;
    }

    public Cart Cart { get; set; }

    public IViewComponentResult Invoke()
    {
        ClaimsIdentity? claimsIdentity = (ClaimsIdentity?)User.Identity;
        Claim? claim = claimsIdentity?.FindFirst(ClaimTypes.NameIdentifier);
        string? applicationUserId = claim?.Value;

        List<CartItem> cartItemList;
        if(applicationUserId != null)
        {
            cartItemList = _unitOfWork.CartItems.GetAllAsync(e => e.ApplicationUserId == applicationUserId).Result;
        }
        else
        {
            cartItemList = Cart.CartItemsList;
        }
        return View(cartItemList);
    }
}