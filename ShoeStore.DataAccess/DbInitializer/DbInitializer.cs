using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using ShoeStore.DataAccess.Data;
using ShoeStore.Models;
using ShoeStore.Ultitity;

namespace ShoeStore.DataAccess.DbInitializer;

public class DbInitializer : IDbInitializer
{
    private readonly UserManager<IdentityUser> _userManager;
    private readonly RoleManager<IdentityRole> _roleManager;
    private readonly DataContext _context;

    public DbInitializer(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager,
        DataContext context)
    {
        _userManager = userManager;
        _roleManager = roleManager;
        _context = context;
    }

    public void Initialize()
    {
        _context.Database.EnsureCreated();
        
        try
        {
            if (_context.Database.GetPendingMigrations().Any())
            {
                _context.Database.Migrate();
            }
        }
        catch (Exception e)
        {
            //
        }

        if (!_roleManager.RoleExistsAsync(SD.Role_Admin).Result)
        {
            _roleManager.CreateAsync(new IdentityRole(SD.Role_Admin)).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole(SD.Role_Employee)).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole(SD.Role_User_Indi)).GetAwaiter().GetResult();

            _userManager.CreateAsync(new ApplicationUser()
            {
                UserName = "admin@gmail.com",
                Name = "Admin",
                Email = "admin@gmail.com",
                PhoneNumber = "111111111",
            }, "Admin@123").GetAwaiter().GetResult();

            ApplicationUser? user = _context.ApplicationUsers.FirstOrDefault(e => e.Email == "admin@gmail.com");

            if (user != null) _userManager.AddToRoleAsync(user, SD.Role_Admin).GetAwaiter().GetResult();
            
            _userManager.CreateAsync(new ApplicationUser()
            {
                UserName = "user@gmail.com",
                Name = "User",
                Email = "user@gmail.com",
                PhoneNumber = "123456789",
                Address = "VTC",
                City = "Hà Nội",
                District = "Quận Hai Bà Trưng",
                Ward = "Phường Minh Khai",
                PostalCode = "1111111",
            }, "User@123").GetAwaiter().GetResult();

            user = _context.ApplicationUsers.FirstOrDefault(e => e.Email == "user@gmail.com");

            if (user != null) _userManager.AddToRoleAsync(user, SD.Role_User_Indi).GetAwaiter().GetResult();
        }
    }
}