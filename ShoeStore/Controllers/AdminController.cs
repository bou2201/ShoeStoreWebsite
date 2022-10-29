using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Models.ViewModels;
using ShoeStore.Ultitity;

namespace ShoeStore.Controllers;

[Authorize(Roles = SD.Role_Admin)]
public class AdminController : Controller
{
    private readonly IUnitOfWork _unitOfWork;

    public AdminController(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IActionResult> Index()
    {
        List<ShopOrder> orders = await _unitOfWork.Orders.GetAllAsync();

        DateTime now = DateTime.Now;
        DateTime monday = StartOfWeek(DateTime.Now, DayOfWeek.Monday);
        DateTime firstDayOfMonth = new DateTime(now.Year, now.Month, 1);
        DateTime firstDayOfYear = new DateTime(now.Year, 1, 1);

        int totalOrdersToday = orders
            .FindAll(e => e.OrderDate.ToString("MM/dd/yyyy") == DateTime.Now.ToString("MM/dd/yyyy")).Count;
        int totalOrdersThisWeek = orders.FindAll(e => e.OrderDate > monday).Count;
        int totalOrdersThisMonth = orders.FindAll(e => e.OrderDate > firstDayOfMonth).Count;

        decimal orderTotalsToday = orders
            .FindAll(e => e.OrderDate.ToString("MM/dd/yyyy") == DateTime.Now.ToString("MM/dd/yyyy"))
            .Sum(e => e.OrderTotal);
        decimal orderTotalsThisWeek = orders.FindAll(e => e.OrderDate > monday).Sum(e => e.OrderTotal);
        decimal orderTotalsThisMonth = orders.FindAll(e => e.OrderDate > firstDayOfMonth).Sum(e => e.OrderTotal);
        decimal orderTotalsThisYear = orders.FindAll(e => e.OrderDate > firstDayOfYear).Sum(e => e.OrderTotal);

        DashBoardViewModel dashBoardViewModel = new DashBoardViewModel()
        {
            OrderTotalsToday = orderTotalsToday,
            OrderTotalsThisWeek = orderTotalsThisWeek,
            OrderTotalsThisMonth = orderTotalsThisMonth,
            OrderTotalsThisYear = orderTotalsThisYear,
            TotalOrdersToday = totalOrdersToday,
            TotalOrdersThisWeek = totalOrdersThisWeek,
            TotalOrdersThisMonth = totalOrdersThisMonth,
        };

        return View(dashBoardViewModel);
    }

    private static DateTime StartOfWeek(DateTime dt, DayOfWeek startOfWeek)
    {
        int diff = (7 + (dt.DayOfWeek - startOfWeek)) % 7;
        return dt.AddDays(-1 * diff).Date;
    }
}