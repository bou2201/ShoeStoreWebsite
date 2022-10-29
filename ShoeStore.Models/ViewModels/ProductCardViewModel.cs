namespace ShoeStore.Models.ViewModels;

public class ProductCardViewModel
{
    public string Name { get; set; }
    public string BrandName { get; set; }
    public string ImagePath { get; set; }
    public string Url { get; set; }
    public decimal Price { get; set; }
    public DateTime Created { get; set; }
}