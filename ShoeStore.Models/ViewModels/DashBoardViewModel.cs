namespace ShoeStore.Models.ViewModels;

public class DashBoardViewModel
{
    public decimal OrderTotalsToday { get; set; }
    public decimal OrderTotalsThisWeek { get; set; }
    public decimal OrderTotalsThisMonth { get; set; }
    public decimal OrderTotalsThisYear { get; set; }
    public int TotalOrdersToday { get; set; }
    public int TotalOrdersThisWeek { get; set; }
    public int TotalOrdersThisMonth { get; set; }
}