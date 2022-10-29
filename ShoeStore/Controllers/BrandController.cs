using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Ultitity;

namespace ShoeStore.Controllers
{
    [Authorize(Roles = SD.Role_Admin)]
    public class BrandController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public BrandController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        // GET: Brand
        public async Task<IActionResult> Index()
        {
              return View(await _unitOfWork.Brands.GetAllAsync());
        }

        // GET: Brand/Details/5
        public async Task<IActionResult> Details(int id)
        {
            var brand = await _unitOfWork.Brands.FirstOrDefaultAsync(m => m.Id == id);
            if (brand == null)
            {
                return NotFound();
            }

            return View(brand);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Name,Description")] Brand brand)
        {
            if (ModelState.IsValid)
            {
                brand.Created = DateTime.Now;
                brand.Edited = DateTime.Now;
                await _unitOfWork.Brands.AddAsync(brand);
                await _unitOfWork.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(brand);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var brand = await _unitOfWork.Brands.FirstOrDefaultAsync(e => e.Id == id);
            if (brand == null)
            {
                return NotFound();
            }
            return View(brand);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Description")] Brand brand)
        {
            var brandFromDb = await _unitOfWork.Brands.FirstOrDefaultAsync(e => e.Id == id);
            
            if (id != brand.Id || brandFromDb == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                brand.Created = brandFromDb.Created;
                brand.Edited = DateTime.Now;
                _unitOfWork.Brands.Update(brand);
                await _unitOfWork.SaveChangesAsync();

                return RedirectToAction("Index");
            }

            return View(brand);
        }

        // GET: Brand/Delete/5
        public async Task<IActionResult> Delete(int id)
        {
            var brand = await _unitOfWork.Brands.FirstOrDefaultAsync(m => m.Id == id);
            if (brand == null)
            {
                return NotFound();
            }

            return View(brand);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var brand = await _unitOfWork.Brands.FirstOrDefaultAsync(e => e.Id == id);
            if (brand == null)
            {
                return NotFound();
            }

            var shoes = await _unitOfWork.Shoes.GetAllAsync(e => e.BrandId == brand.Id);
            if(shoes.Count == 0)
            {
                _unitOfWork.Brands.Remove(brand);
                await _unitOfWork.SaveChangesAsync();
            }
            else
            {
                TempData[SD.Error] = "Some shoe models is belong to this Brand. Can not delete it!";
            }

            return RedirectToAction(nameof(Index));
        }
    }
}
