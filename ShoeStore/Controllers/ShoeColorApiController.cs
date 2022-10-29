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
    [Authorize(Roles = SD.Role_Admin)]
    public class ShoeColorApiController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public ShoeColorApiController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        // GET: api/ShoeColorApi
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ShoeColor>>> GetShoeColor()
        {

            return await _unitOfWork.ShoeColors.GetAllAsync();
        }
        
        // GET: api/ShoeColorApi/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ShoeColor>> GetShoeColor(int id)
        {

            var shoeColor = await _unitOfWork.ShoeColors.FirstOrDefaultAsync(e => e.Id == id);

            if (shoeColor == null)
            {
                return NotFound();
            }

            return shoeColor;
        }

        // PUT: api/ShoeColorApi/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutShoeColor(int id, ShoeColor shoeColor)
        {
            if (id != shoeColor.Id)
            {
                return BadRequest();
            }

            // _context.Entry(shoeColor).State = EntityState.Modified;

            try
            {
                await _unitOfWork.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ShoeColorExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/ShoeColorApi
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ShoeColor>> PostShoeColor(ShoeColor shoeColor)
        {

            await _unitOfWork.ShoeColors.AddAsync(shoeColor);
            await _unitOfWork.SaveChangesAsync();

            return CreatedAtAction("GetShoeColor", new { id = shoeColor.Id }, shoeColor);
        }

        // DELETE: api/ShoeColorApi/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteShoeColor(int id)
        {

            var shoeColor = await _unitOfWork.ShoeColors.FirstOrDefaultAsync(e => e.Id == id);
            if (shoeColor == null)
            {
                return NotFound();
            }

            _unitOfWork.ShoeColors.Remove(shoeColor);
            await _unitOfWork.SaveChangesAsync();

            return NoContent();
        }

        private bool ShoeColorExists(int id)
        {
            return (_unitOfWork.ShoeColors?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}