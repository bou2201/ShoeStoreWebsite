namespace ShoeStore.Models.ViewModels;

public class ProductDetailViewModel
{
    public Shoe Shoe { get; set; }
    public ShoeColor? ShoeColor { get; set; }
    public List<ShoeColor> RelatedShoeColors { get; set; }
    public IEnumerable<Image>? ShoeImages { get; set; }
    public IEnumerable<ShoeSize>? ShoeSizes { get; set; }
    public IEnumerable<ShoeColor>? RelatedProduct { get; set; }
}