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
    public class CategoriesController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public CategoriesController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _unitOfWork.Categories.GetAllAsync(include: o => o.Include(e => e.Parent)!));
        }

        public async Task<IActionResult> Details(int id)
        {
            // var category = await _unitOfWork.Categories
            //     .FirstOrDefaultAsyncWithParent(m => m.Id == id);
            var category = await _unitOfWork.Categories
                .FirstOrDefaultAsync(e => e.Id == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        public async Task<IActionResult> Create()
        {
            ViewBag.ParentId = new SelectList(await _unitOfWork.Categories.GetAllAsync(), "Id", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Name,DisplayName,Description,ParentId")] Category category)
        {
            if (ModelState.IsValid)
            {
                await _unitOfWork.Categories.AddAsync(category);
                await _unitOfWork.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            return View(category);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var category = await _unitOfWork.Categories.FirstOrDefaultAsync(e => e.Id == id);

            if (category == null)
            {
                return NotFound();
            }

            List<Category> list = (await _unitOfWork.Categories.GetAllAsync()).ToList();
            list.RemoveAll(e => e.Id == category.Id);

            ViewBag.ParentId = new SelectList(list, "Id", "Name");

            return View(category);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([Bind("Id,Name,DisplayName,Description,ParentId")] Category category)
        {
            var categoryFromDb = await _unitOfWork.Categories.FirstOrDefaultAsync(e => e.Id == category.Id);

            if (categoryFromDb == null)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                var list = await _unitOfWork.Categories.GetAllAsync();
                list.RemoveAll(e => e.Id == category.Id);

                ViewBag.ParentId = new SelectList(list, "Id", "Name");
                return View(category);
            }

            _unitOfWork.Categories.Update(category);
            await _unitOfWork.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Delete(int id)
        {
            var category = await _unitOfWork.Categories.FirstOrDefaultAsync(m => m.Id == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var category = await _unitOfWork.Categories.FirstOrDefaultAsync(e => e.Id == id);
            if (category == null)
            {
                return NotFound();
            }

            var shoes = await _unitOfWork.Shoes.GetAllAsync(e => e.CategoryId == category.Id);
            if (shoes.Count == 0)
            {
                _unitOfWork.Categories.Remove(category);
                await _unitOfWork.SaveChangesAsync();
            }
            else
            {
                TempData[SD.Error] = "Some ShoeModels is belong to this Category. Can not delete it!";
            }

            return RedirectToAction(nameof(Index));
        }
    }
}