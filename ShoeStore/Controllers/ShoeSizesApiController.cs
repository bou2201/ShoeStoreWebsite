using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Ultitity;

namespace ShoeStore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    // [Authorize(Roles = SD.Role_Admin)]
    public class ShoeSizesApiController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public ShoeSizesApiController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        // GET: api/ShoeSizesApi
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ShoeSize>>> GetShoeSize()
        {
            return await _unitOfWork.ShoeSizes.GetAllAsync();
        }

        // GET: api/ShoeSizesApi/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ShoeSize>> GetShoeSize(int id)
        {
            var shoeSize = await _unitOfWork.ShoeSizes.FirstOrDefaultAsync(e => e.Id == id);

            if (shoeSize == null)
            {
                return NotFound();
            }

            return shoeSize;
        }

        // PUT: api/ShoeSizesApi/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<ActionResult<IEnumerable<ShoeSize>>> PutShoeSize(int id, ShoeSize shoeSize)
        {
            if (id != shoeSize.Id)
            {
                return BadRequest();
            }

            ShoeSize? shoeSizeFromDb = await _unitOfWork.ShoeSizes.FirstOrDefaultAsync(e => e.Id == id);

            if (shoeSizeFromDb == null || (shoeSize.Quantity is <= 0 or > 99))
            {
                return BadRequest();
            }

            shoeSizeFromDb.Quantity = shoeSize.Quantity;

            await _unitOfWork.SaveChangesAsync();

            return await _unitOfWork.ShoeSizes.GetAllAsync(e => e.ShoeColorId == shoeSizeFromDb.ShoeColorId,
                include: o => o.Include(e => e.Size)!,
                orderBy: e => e.Size!.Value);
        }

        // POST: api/ShoeSizesApi
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<IEnumerable<ShoeSize>>> PostShoeSize(ShoeSize shoeSize)
        {
            ShoeColor? shoeColor = await _unitOfWork.ShoeColors
                .FirstOrDefaultAsync(e => e.Id == shoeSize.ShoeColorId);
            Size? size = await _unitOfWork.Sizes
                .FirstOrDefaultAsync(e => e.Id == shoeSize.SizeId);

            ShoeSize? duplicateShoeSize = await _unitOfWork.ShoeSizes
                .FirstOrDefaultAsync(e => e.SizeId == shoeSize.Id && e.ShoeColorId == shoeSize.ShoeColorId);

            if (shoeColor == null || size == null || duplicateShoeSize != null || shoeSize.Quantity <= 0 ||
                shoeSize.Quantity > 99)
            {
                return BadRequest();
            }

            await _unitOfWork.ShoeSizes.AddAsync(shoeSize);
            await _unitOfWork.SaveChangesAsync();

            // return CreatedAtAction("GetShoeSize", new { id = shoeSize.Id }, shoeSize);
            return await _unitOfWork.ShoeSizes.GetAllAsync(e => e.ShoeColorId == shoeSize.ShoeColorId,
                include: o => o.Include(e => e.Size),
                orderBy: e => e.Size!.Value);
        }

        // DELETE: api/ShoeSizesApi/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<IEnumerable<ShoeSize>>> DeleteShoeSize(int id)
        {
            var shoeSize = await _unitOfWork.ShoeSizes.FirstOrDefaultAsync(e => e.Id == id);
            if (shoeSize == null)
            {
                return NotFound();
            }

            int shoeColorId = shoeSize.ShoeColorId;

            _unitOfWork.ShoeSizes.Remove(shoeSize);
            await _unitOfWork.SaveChangesAsync();

            // return NoContent();
            return await _unitOfWork.ShoeSizes.GetAllAsync(e => e.ShoeColorId == shoeColorId,
                include: o => o.Include(e => e.Size),
                orderBy: e => e.Size!.Value);
        }

        private bool ShoeSizeExists(int id)
        {
            return (_unitOfWork.ShoeSizes?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}