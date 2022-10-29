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
    public class ShoeSizesController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public ShoeSizesController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        // GET: ShoeSizes
        public async Task<IActionResult> Index()
        {
            var shoeSizes = _unitOfWork.ShoeSizes.GetAllAsync(include: e => e.Include(s => s.ShoeColor)
                .Include(s => s.Size)!);
            return View(await shoeSizes);
        }

        // GET: ShoeSizes/Details/5
        public async Task<IActionResult> Details(int id)
        {
            var shoeSize = await _unitOfWork.ShoeSizes.FirstOrDefaultAsync(e => e.Id == id,
                include: e => e.Include(s => s.ShoeColor)
                    .Include(s => s.Size)!);
            if (shoeSize == null)
            {
                return NotFound();
            }

            return View(shoeSize);
        }

        // GET: ShoeSizes/Create
        public async Task<IActionResult> Create(int shoeColorId)
        {
            ViewData["ShoeColorid"] =
                new SelectList(await _unitOfWork.ShoeColors.GetAllAsync(), "Id", "Id", shoeColorId);
            ViewData["SizeId"] = new SelectList(await _unitOfWork.Sizes.GetAllAsync(), "Id", "Unit");
            return View();
        }

        // POST: ShoeSizes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Quantity,Reorder,ShoeColorid,SizeId")] ShoeSize shoeSize)
        {
            if (ModelState.IsValid)
            {
                await _unitOfWork.ShoeSizes.AddAsync(shoeSize);
                await _unitOfWork.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewData["ShoeColorid"] = new SelectList(await _unitOfWork.ShoeColors.GetAllAsync(), "Id", "Id",
                shoeSize.ShoeColorId);
            ViewData["SizeId"] = new SelectList(await _unitOfWork.Sizes.GetAllAsync(), "Id", "Unit", shoeSize.SizeId);
            return View(shoeSize);
        }

        // GET: ShoeSizes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            var shoeSize = await _unitOfWork.ShoeSizes.FirstOrDefaultAsync(e => e.Id == id);
            if (shoeSize == null)
            {
                return NotFound();
            }

            ViewData["ShoeColorid"] = new SelectList(await _unitOfWork.ShoeColors.GetAllAsync(), "Id", "Id",
                shoeSize.ShoeColorId);
            ViewData["SizeId"] = new SelectList(await _unitOfWork.Sizes.GetAllAsync(), "Id", "Unit", shoeSize.SizeId);
            return View(shoeSize);
        }

        // POST: ShoeSizes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,
            [Bind("Id,Quantity,Reorder,ShoeColorid,SizeId")] ShoeSize shoeSize)
        {
            if (id != shoeSize.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                _unitOfWork.ShoeSizes.Update(shoeSize);
                await _unitOfWork.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }

            ViewData["ShoeColorid"] = new SelectList(await _unitOfWork.ShoeColors.GetAllAsync(), "Id", "Id",
                shoeSize.ShoeColorId);
            ViewData["SizeId"] = new SelectList(await _unitOfWork.Sizes.GetAllAsync(), "Id", "Unit", shoeSize.SizeId);
            return View(shoeSize);
        }

        // GET: ShoeSizes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            var shoeSize = await _unitOfWork.ShoeSizes.FirstOrDefaultAsync(e => e.Id == id,
                include: e => e.Include(s => s.ShoeColor)
                    .Include(s => s.Size)!);
            if (shoeSize == null)
            {
                return NotFound();
            }

            return View(shoeSize);
        }

        // POST: ShoeSizes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var shoeSize = await _unitOfWork.ShoeSizes.FirstOrDefaultAsync(e => e.Id == id);
            if (shoeSize != null)
            {
                _unitOfWork.ShoeSizes.Remove(shoeSize);
            }

            await _unitOfWork.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
    }
}