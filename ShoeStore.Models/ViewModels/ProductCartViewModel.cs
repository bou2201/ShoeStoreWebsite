namespace ShoeStore.Models.ViewModels;

public class ProductCartViewModel
{
    public int ShoeSizeId { get; set; }
    public int CartItemId { get; set; }
    public decimal Price { get; set; }
    public string? ProductName { get; set; }
    public string? Size { get; set; }
    public string? BrandName { get; set; }
    public string? ImgPath { get; set; }
    public int Quantity { get; set; }
    public string? ProductUrl { get; set; }
}