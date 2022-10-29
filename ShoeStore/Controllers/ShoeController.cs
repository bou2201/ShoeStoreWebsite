using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Ultitity;

namespace ShoeStore.Controllers
{
    [Authorize(Roles = SD.Role_Admin)]
    public class ShoeController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public ShoeController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IActionResult> Index()
        {
            var shoes = _unitOfWork.Shoes.GetAllAsync(include: e => e.Include(s => s.Brand)!);
            return View(await shoes);
        }

        public async Task<IActionResult> Details(int id)
        {
            var shoe = await _unitOfWork.Shoes.FirstOrDefaultAsync(e => e.Id == id,
                include: e =>
                    e.Include(s => s.Brand)
                        .Include(s => s.Category)
                        .Include(s => s.ShoeColors)!
                        .ThenInclude(s => s.Color)
                        .Include(s => s.ShoeColors)!
                        .ThenInclude(s => s.Images)!
            );

            if (shoe == null)
            {
                return NotFound();
            }

            return View(shoe);
        }

        public async Task<IActionResult> Create()
        {
            ViewBag.BrandId = new SelectList(await _unitOfWork.Brands.GetAllAsync(), "Id", "Name");
            ViewBag.CategoryId = new SelectList(await _unitOfWork.Categories.GetAllAsync(), "Id", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("Id,Name,ProductCode,Priority,Active,Features,Description,Note,BrandId,CategoryId")]
            Shoe shoe)
        {
            if (ModelState.IsValid)
            {
                shoe.Created = DateTime.Now;
                shoe.Edited = DateTime.Now;
                await _unitOfWork.Shoes.AddAsync(shoe);
                await _unitOfWork.SaveChangesAsync();
                return RedirectToAction(nameof(Edit), new { id = shoe.Id });
            }

            // ViewData["BrandId"] = new SelectList(await _unitOfWork.Brands.GetAllAsync(), "Id", "Unit", shoe.BrandId);
            // return View(shoe);
            return await Create();
        }

        public async Task<IActionResult> Edit(int id)
        {
            var shoe = await _unitOfWork.Shoes.FirstOrDefaultAsync(e => e.Id == id,
                include: o => o.Include(e => e.ShoeColors)!
                    .ThenInclude(e => e.Color)
                    .Include(e => e.ShoeColors)!
                    .ThenInclude(e => e.Images)!);

            if (shoe == null)
            {
                return NotFound();
            }

            ViewBag.BrandId = new SelectList(await _unitOfWork.Brands.GetAllAsync(), "Id", "Name", shoe.BrandId);
            ViewBag.CategoryId =
                new SelectList(await _unitOfWork.Categories.GetAllAsync(), "Id", "Name", shoe.CategoryId);

            return View(shoe);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,
            [Bind("Id,Name,ProductCode,Active,Features,Description,Note,BrandId,CategoryId")]
            Shoe shoe)
        {
            var shoeFromDb = await _unitOfWork.Shoes.FirstOrDefaultAsync(e => e.Id == id);
            if (shoeFromDb == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                shoe.Created = shoeFromDb.Created;
                shoe.Edited = DateTime.Now;
                _unitOfWork.Shoes.Update(shoe);
                await _unitOfWork.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.BrandId = new SelectList(await _unitOfWork.Brands.GetAllAsync(), "Id", "Unit", shoe.BrandId);
            ViewBag.CategoryId =
                new SelectList(await _unitOfWork.Categories.GetAllAsync(), "Id", "Unit", shoe.CategoryId);
            return View(shoe);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            var shoe = await _unitOfWork.Shoes
                .FirstOrDefaultAsync(m => m.Id == id,
                    include: o => o.Include(s => s.Brand)
                        .Include(s => s.Category)!);

            if (shoe == null)
            {
                return NotFound();
            }

            return View(shoe);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var shoe = await _unitOfWork.Shoes.FirstOrDefaultAsync(e => e.Id == id);
            if (shoe == null)
            {
                return NotFound();
            }

            var shoeColors = await _unitOfWork.ShoeColors.GetAllAsync(e => e.ShoeId == shoe.Id);
            if (shoeColors.Count == 0)
            {
                _unitOfWork.Shoes.Remove(shoe);
                await _unitOfWork.SaveChangesAsync();
            }
            else
            {
                TempData[SD.Error] = "Some ShoeColorModels is belong to this Shoe Model. Can not delete it!";
            }

            return RedirectToAction(nameof(Index));
        }
    }
}