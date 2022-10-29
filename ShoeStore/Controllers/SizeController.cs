using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Ultitity;

namespace ShoeStore.Controllers
{
    [Authorize(Roles = SD.Role_Admin)]
    public class SizeController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public SizeController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _unitOfWork.Sizes.GetAllAsync());
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Unit,Value")] Size size)
        {
            if (ModelState.IsValid)
            {
                size.Unit = size.Unit.Trim();
                Size? sizeFromDb = await _unitOfWork.Sizes.FirstOrDefaultAsync(e => e.Unit == size.Unit && Math.Abs(e.Value - size.Value) < 0.001);
                if (sizeFromDb != null)
                {
                    TempData[SD.Error] = "This size already existed!";
                }
                else
                {
                    await _unitOfWork.Sizes.AddAsync(size);
                    await _unitOfWork.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
            }

            return View(size);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var size = await _unitOfWork.Sizes.FirstOrDefaultAsync(e => e.Id == id);
            if (size == null)
            {
                return NotFound();
            }

            return View(size);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Unit,Value,SortOrder")] Size size)
        {
            var sizeFromDb = await _unitOfWork.Sizes.FirstOrDefaultAsync(e => e.Id == id);
            if (id != size.Id || sizeFromDb == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                _unitOfWork.Sizes.Update(size);
                await _unitOfWork.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }

            return View(size);
        }

        public async Task<IActionResult> Delete(int id)
        {
            var size = await _unitOfWork.Sizes.FirstOrDefaultAsync(m => m.Id == id);
            if (size == null)
            {
                return NotFound();
            }

            return View(size);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var size = await _unitOfWork.Sizes.FirstOrDefaultAsync(e => e.Id == id);
            if (size == null)
            {
                return NotFound();
            }

            var shoeSizes = await _unitOfWork.ShoeSizes.GetAllAsync(e => e.SizeId == size.Id);
            if (shoeSizes.Count == 0)
            {
                _unitOfWork.Sizes.Remove(size);
                await _unitOfWork.SaveChangesAsync();
            }
            else
            {
                TempData[SD.Error] = "Some Shoe is belong to this Size. Can not delete it!";
            }

            return RedirectToAction(nameof(Index));
        }
    }
}