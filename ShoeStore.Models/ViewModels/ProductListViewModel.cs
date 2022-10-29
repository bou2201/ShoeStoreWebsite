using Microsoft.AspNetCore.Mvc.Rendering;

namespace ShoeStore.Models.ViewModels;

public class ProductListViewModel
{
    public List<ShoeColor>? ShoeColors { get; set; }
    public IEnumerable<ProductCardViewModel>? ProductCards { get; set; }
    public List<Brand>? Brands { get; set; }
    public List<Size>? Sizes { get; set; }
    public int? SelectedBrandId { get; set; }
    public int? SelectedSizeId { get; set; }
    public decimal? maxPrice { get; set; } = 300;
    public string? SearchedBrand { get; set; }
    public List<SelectListItem>? SelectListItems { get; set; }
    public PagingInfo PagingInfo { get; set; } = new();

    public string CurrentBrand { get; set; }
}