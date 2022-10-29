using Microsoft.EntityFrameworkCore.Storage;
using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;

namespace ShoeStore.DataAccess.Repository;

public class UnitOfWork : IUnitOfWork
{
    private readonly DataContext _context;

    public UnitOfWork(DataContext context)
    {
        _context = context;
        Brands = new BrandRepository(_context);
        Colors = new ColorRepository(_context);
        Sizes = new SizeRepository(_context);
        Categories = new CategoryRepository(_context);
        Shoes = new ShoeRepository(_context);
        ShoeColors = new ShoeColorRepository(_context);
        Images = new ImageRepository(_context);
        ShoeSizes = new ShoeSizeRepository(_context);
        CartItems = new CartItemRepository(_context);
        ApplicationUsers = new ApplicationUserRepository(_context);
        Orders = new OrderRepository(_context);
        OrderDetails = new OrderDetailRepository(_context);
    }

    public IBrandRepository Brands { get; }
    public IColorRepository Colors { get; }
    public ISizeRepository Sizes { get; }
    public ICategoryRepository Categories { get; }
    public IShoeRepository Shoes { get; }
    public IShoeColorRepository ShoeColors { get; }
    public IImageRepository Images { get; }
    public IShoeSizeRepository ShoeSizes { get; }
    public ICartItemRepository CartItems { get; }
    public IApplicationUserRepository ApplicationUsers { get; }
    public IOrderRepository Orders { get; }
    public IOrderDetailRepository OrderDetails { get; }

    public async Task SaveChangesAsync()
    {
        await _context.SaveChangesAsync();
    }
    
    public async Task<IDbContextTransaction> BeginTransactionAsync()
    {
        return await _context.Database.BeginTransactionAsync();
    }
    // public async Task CommitTransactionAsync()
    // {
    //     await _context.Database.CommitTransactionAsync();
    // }
}