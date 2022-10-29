using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Models.ViewModels;
using ShoeStore.Ultitity;

namespace ShoeStore.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly IUnitOfWork _unitOfWork;

    public HomeController(ILogger<HomeController> logger, IUnitOfWork unitOfWork)
    {
        _logger = logger;
        _unitOfWork = unitOfWork;
    }

    public async Task<IActionResult> Index()
    {
        // if (User.IsInRole(SD.Role_Admin) || User.IsInRole(SD.Role_Employee))
        // {
        //     return RedirectToAction("Index", "Admin");
        // }
        
        Brand? nike = await _unitOfWork.Brands.FirstOrDefaultAsync(e => e.Name == "Nike");
        Brand? newBalance = await _unitOfWork.Brands.FirstOrDefaultAsync(e => e.Name == "New Balance");
        Brand? asics = await _unitOfWork.Brands.FirstOrDefaultAsync(e => e.Name == "Asics");
        Brand? saucony = await _unitOfWork.Brands.FirstOrDefaultAsync(e => e.Name == "Saucony");
        
        HomeViewModel homeViewModel = new HomeViewModel()
        {
            FeatureProducts = await _unitOfWork.ShoeColors
                .GetAllAsync(include: o => o
                        .Include(e => e.Images)
                        .Include(e => e.Shoe)
                        .ThenInclude(e => e!.Brand)!,
                    orderBy: e => e.Priority,
                    take: 4
                ),
            NikeProducts = await _unitOfWork.ShoeColors
                .GetAllAsync(e => nike != null && e.Shoe!.BrandId == nike.Id,
                    include: o => o
                    .Include(e => e.Images)
                    .Include(e => e.Shoe)
                    .ThenInclude(e => e!.Brand)!,
                    orderBy: e => e.Priority,
                    take: 4
                ),
            NewBalanceProducts = await _unitOfWork.ShoeColors
                .GetAllAsync(e => newBalance != null && e.Shoe!.BrandId == newBalance.Id,
                    include: o => o
                        .Include(e => e.Images)
                        .Include(e => e.Shoe)
                        .ThenInclude(e => e!.Brand)!,
                    orderBy: e => e.Priority,
                    take: 4
                ),
            AsicsProducts = await _unitOfWork.ShoeColors
                .GetAllAsync(e => asics != null && e.Shoe!.BrandId == asics.Id,
                    include: o => o
                        .Include(e => e.Images)
                        .Include(e => e.Shoe)
                        .ThenInclude(e => e!.Brand)!,
                    orderBy: e => e.Priority,
                    take: 4
                ),
            SauconyProducts = await _unitOfWork.ShoeColors
                .GetAllAsync(e => asics != null && e.Shoe!.BrandId == asics.Id,
                    include: o => o
                        .Include(e => e.Images)
                        .Include(e => e.Shoe)
                        .ThenInclude(e => e!.Brand)!,
                    orderBy: e => e.Priority,
                    take: 4
                ),
        };
        return View(homeViewModel);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}