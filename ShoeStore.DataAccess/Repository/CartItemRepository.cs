using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository;

public class CartItemRepository : Repository<CartItem>, ICartItemRepository
{
    public CartItemRepository(DataContext context) : base(context)
    {
    }

    public void Update(CartItem obj)
    {
        _dbSet.Update(obj);
    }
}