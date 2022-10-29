using System.Text.RegularExpressions;
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
    public class ShoeColorsController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public ShoeColorsController(IWebHostEnvironment webHostEnvironment, IUnitOfWork unitOfWork)
        {
            _webHostEnvironment = webHostEnvironment;
            _unitOfWork = unitOfWork;
        }

        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _unitOfWork.ShoeColors.GetAllAsync(include: e => e.Include(s => s.Color)
                .Include(s => s.Shoe)!);
            return View(await applicationDbContext);
        }

        // GET: ShoeColors/Details/5
        public async Task<IActionResult> Details(int id)
        {
            var shoeColor = await _unitOfWork.ShoeColors.FirstOrDefaultAsync(e => e.Id == id,
                include: e => e.Include(s => s.Images)
                    .Include(s => s.ShoeSizes)!
                    .ThenInclude(e => e.Size));

            if (shoeColor == null)
            {
                return NotFound();
            }

            ViewData["ColorId"] =
                new SelectList(new[] { await _unitOfWork.Colors.FirstOrDefaultAsync(e => e.Id == shoeColor.ColorId) },
                    "Id", "Name", shoeColor.ColorId);
            ViewData["ShoeId"] =
                new SelectList(new[] { await _unitOfWork.Shoes.FirstOrDefaultAsync(e => e.Id == shoeColor.ShoeId) },
                    "Id", "Name", shoeColor.ShoeId);
            // ViewBag.SizeId = new SelectList(_context.Sizes, "Id", "Value");
            ViewBag.Sizes = await _unitOfWork.Sizes.GetAllAsync();

            return View(shoeColor);
        }

        // GET: ShoeColors/Create
        public async Task<IActionResult> Create(int shoeId)
        {
            Shoe? shoe = await _unitOfWork.Shoes.FirstOrDefaultAsync(e => e.Id == shoeId);
            if (shoe == null)
            {
                return NotFound();
            }

            ViewData["ColorId"] =
                new SelectList(await _unitOfWork.Colors.GetAllAsync(orderBy: e => e.Name), "Id", "Name");
            ViewData["ShoeId"] = new SelectList(new[] { shoe }, "Id", "Name", shoeId.ToString());
            // ViewData["ShoeName"] = shoe.Name;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            // [Bind("Id,FactoryPrice,SalePrice,SortOrder,Active,ShoeId,ColorId")]
            ShoeColor shoeColor, IFormFileCollection? formFileCollection)
        {
            if (ModelState.IsValid)
            {
                Shoe? shoeFromDb = await _unitOfWork.Shoes.FirstOrDefaultAsync(e => e.Id == shoeColor.ShoeId);
                Color? colorFromDb = await _unitOfWork.Colors.FirstOrDefaultAsync(e => e.Id == shoeColor.ColorId);
                if (shoeFromDb == null || colorFromDb == null)
                {
                    return NotFound();
                }

                shoeColor.Url = Regex.Replace(shoeFromDb.Name.ToLower(), @"\W+", "-")
                                + "-"
                                + Regex.Replace(colorFromDb.Name.ToLower(), @"\W+", "-");

                shoeColor.Created = DateTime.Now;
                shoeColor.Edited = DateTime.Now;
                await _unitOfWork.ShoeColors.AddAsync(shoeColor);
                await _unitOfWork.SaveChangesAsync();

                if (formFileCollection != null)
                {
                    int count = 0;
                    // var imageUrls = new List<string>();
                    string root = _webHostEnvironment.WebRootPath;

                    foreach (var formFile in formFileCollection)
                    {
                        string fileName = Guid.NewGuid().ToString();
                        string fileExtension = Path.GetExtension(formFile.FileName);
                        string filePath = Path.Combine(root, @"images\shoes", fileName + fileExtension);
                        await using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            await formFile.CopyToAsync(fileStream);
                        }

                        // imageUrls.Add(@"\images\shoes\" + fileName + fileExtension);
                        var image = new Image
                        {
                            ShoeColorId = shoeColor.Id,
                            Path = @"\images\shoes\" + fileName + fileExtension,
                            SortOrder = ++count
                        };
                        await _unitOfWork.Images.AddAsync(image);
                    }

                    await _unitOfWork.SaveChangesAsync();
                }

                return RedirectToAction(nameof(Edit), new { id = shoeColor.Id });
            }

            ViewData["ColorId"] = new SelectList(await _unitOfWork.Colors.GetAllAsync(orderBy: e => e.Name), "Id",
                "Name", shoeColor.ColorId);
            ViewData["ShoeId"] = new SelectList(await _unitOfWork.Shoes.GetAllAsync(), "Id", "Name", shoeColor.ShoeId);
            return View(shoeColor);
        }

        // GET: ShoeColors/Edit/5
        public async Task<IActionResult> Edit(int id)
        {
            var shoeColor = await _unitOfWork.ShoeColors.FirstOrDefaultAsync(e => e.Id == id,
                include: e => e.Include(s => s.Images)
                    .Include(s => s.ShoeSizes)!
                    .ThenInclude(e => e.Size)!);

            if (shoeColor == null)
            {
                return NotFound();
            }

            ViewData["ColorId"] =
                new SelectList(await _unitOfWork.Colors.GetAllAsync(), "Id", "Name", shoeColor.ColorId);
            ViewData["ShoeId"] = new SelectList(await _unitOfWork.Shoes.GetAllAsync(), "Id", "Name", shoeColor.ShoeId);
            // ViewBag.SizeId = new SelectList(_context.Sizes, "Id", "Value");
            ViewBag.Sizes = await _unitOfWork.Sizes.GetAllAsync();

            return View(shoeColor);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,
            [Bind("Id,FactoryPrice,SalePrice,SortOrder,Active,ShoeId,ColorId")]
            ShoeColor shoeColor)
        {
            var shoeColorFromDb = await _unitOfWork.ShoeColors.FirstOrDefaultAsync(e => e.Id == id);
            if (id != shoeColor.Id || shoeColorFromDb == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                shoeColor.Created = shoeColorFromDb.Created;
                shoeColor.Edited = DateTime.Now;
                _unitOfWork.ShoeColors.Update(shoeColor);
                await _unitOfWork.SaveChangesAsync();

                return RedirectToAction(nameof(Edit));
            }

            ViewData["ColorId"] =
                new SelectList(await _unitOfWork.Colors.GetAllAsync(), "Id", "Name", shoeColor.ColorId);
            ViewData["ShoeId"] = new SelectList(await _unitOfWork.Shoes.GetAllAsync(), "Id", "Name", shoeColor.ShoeId);
            ViewData["SizeId"] = new SelectList(await _unitOfWork.Sizes.GetAllAsync(), "id", "name");
            return View(shoeColor);
        }

        public async Task<IActionResult> Delete(int id)
        {
            var shoeColor = await _unitOfWork.ShoeColors.FirstOrDefaultAsync(e => e.Id == id,
                include: e => e.Include(s => s.Images)
                    .Include(s => s.ShoeSizes)!
                    .ThenInclude(e => e.Size));

            if (shoeColor == null)
            {
                return NotFound();
            }

            ViewData["ColorId"] =
                new SelectList(new[] { await _unitOfWork.Colors.FirstOrDefaultAsync(e => e.Id == shoeColor.ColorId) },
                    "Id", "Name", shoeColor.ColorId);
            ViewData["ShoeId"] =
                new SelectList(new[] { await _unitOfWork.Shoes.FirstOrDefaultAsync(e => e.Id == shoeColor.ShoeId) },
                    "Id", "Name", shoeColor.ShoeId);
            // ViewBag.SizeId = new SelectList(_context.Sizes, "Id", "Value");
            ViewBag.Sizes = await _unitOfWork.Sizes.GetAllAsync();

            return View(shoeColor);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var shoeColor = await _unitOfWork.ShoeColors.FirstOrDefaultAsync(e => e.Id == id);
            if (shoeColor == null)
            {
                return NotFound();
            }
            
            var shoeSizes = await _unitOfWork.ShoeSizes.GetAllAsync(e => e.ShoeColorId == shoeColor.Id);
            
            if(shoeSizes.Count == 0)
            {
                List<Image> shoeImages = await _unitOfWork.Images.GetAllAsync(e => e.ShoeColorId == shoeColor.Id);
                if (shoeImages != null && shoeImages.Count > 0)
                {
                    var root = _webHostEnvironment.WebRootPath;
                    foreach (var image in shoeImages)
                    {
                        string imageUrl = image.Path;
                        var imagePath = Path.Combine(root, imageUrl.TrimStart('\\'));
                        if (System.IO.File.Exists(imagePath))
                        {
                            System.IO.File.Delete(imagePath);
                        }
                    }
                }

                _unitOfWork.ShoeColors.Remove(shoeColor);
                await _unitOfWork.SaveChangesAsync();
            }
            else
            {
                TempData[SD.Error] = "Some shoes is belong to this ShoeColor. Can not delete it!";
            }
            
            return RedirectToAction("Edit", "Shoe", new {id = shoeColor.ShoeId});
        }
    }
}