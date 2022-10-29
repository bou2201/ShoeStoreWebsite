using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Ultitity;

namespace ShoeStore.Controllers
{
    [Authorize(Roles = SD.Role_Admin)]
    public class ColorController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public ColorController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _unitOfWork.Colors.GetAllAsync());
        }

        public async Task<IActionResult> Details(int id)
        {
            var color = await _unitOfWork.Colors.FirstOrDefaultAsync(m => m.Id == id);
            if (color == null)
            {
                return NotFound();
            }

            return View(color);
        }

        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Priority")] Color color)
        {
            if (ModelState.IsValid)
            {
                color.Name = color.Name.Trim();
                if (_unitOfWork.Colors.Any(e => e.Name == color.Name))
                {
                    ModelState.AddModelError("name", "This color has already existed!");
                    return await Create();
                }
                
                await _unitOfWork.Colors.AddAsync(color);
                await _unitOfWork.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            return View(color);
        }

        // GET: Color/Edit/5
        public async Task<IActionResult> Edit(int id)
        {
            var color = await _unitOfWork.Colors.FirstOrDefaultAsync(e => e.Id == id);
            if (color == null)
            {
                return NotFound();
            }

            return View(color);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Priority")] Color color)
        {
            var colorFromDb = await _unitOfWork.Colors.FirstOrDefaultAsync(e => e.Id == id);
            if (colorFromDb == null)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
                return View(color);

            _unitOfWork.Colors.Update(color);
            await _unitOfWork.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Delete(int id)
        {
            var color = await _unitOfWork.Colors.FirstOrDefaultAsync(m => m.Id == id);
            if (color == null)
            {
                return NotFound();
            }

            return View(color);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var color = await _unitOfWork.Colors.FirstOrDefaultAsync(e => e.Id == id);
            if (color == null)
            {
                return NotFound();
            }
            
            var shoeColors = await _unitOfWork.ShoeColors.GetAllAsync(e => e.ColorId == color.Id);
            if(shoeColors.Count == 0)
            {
                _unitOfWork.Colors.Remove(color);
                await _unitOfWork.SaveChangesAsync();
            }
            else
            {
                TempData[SD.Error] = "Some ShoeColorModels is belong to this Color. Can not delete it!";
            }

            return RedirectToAction(nameof(Index));
        }
    }
}