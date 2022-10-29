namespace ShoeStore.Models.ViewModels;

public class CartViewModel
{
    public List<ProductCartViewModel> ProductCartsList { get; set; } = new();
    public string? ReturnUrl { get; set; }
    public ShopOrder ShopOrder { get; set; } = new ShopOrder();
}