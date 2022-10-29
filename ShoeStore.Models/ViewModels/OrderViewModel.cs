namespace ShoeStore.Models.ViewModels;

public class OrderViewModel
{
    public ShopOrder? Order { get; set; }
    public IEnumerable<OrderDetail> OrderDetails { get; set; }
}