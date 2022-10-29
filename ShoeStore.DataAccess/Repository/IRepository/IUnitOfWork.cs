using Microsoft.EntityFrameworkCore.Storage;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IUnitOfWork
{
    IBrandRepository Brands { get; }
    IColorRepository Colors { get; }
    ISizeRepository Sizes { get; }
    ICategoryRepository Categories { get; }
    IShoeRepository Shoes { get; }
    IShoeColorRepository ShoeColors { get; }
    IImageRepository Images { get; }
    IShoeSizeRepository ShoeSizes { get; }
    ICartItemRepository CartItems { get; }
    IApplicationUserRepository ApplicationUsers { get; }
    IOrderRepository Orders { get; }
    IOrderDetailRepository OrderDetails { get; }

    Task SaveChangesAsync();
    
    public Task<IDbContextTransaction> BeginTransactionAsync();
    // public Task CommitTransactionAsync();
}