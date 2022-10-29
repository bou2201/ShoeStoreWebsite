using Microsoft.AspNetCore.Mvc;
using ShoeStore.DataAccess.Data;

namespace ShoeStore.Components;

public class NavigationMenuViewComponent : ViewComponent
{
    private DataContext _context;

    public NavigationMenuViewComponent(DataContext context)
    {
        _context = context;
    }

    public IViewComponentResult Invoke()
    {
        return View();
    }
}