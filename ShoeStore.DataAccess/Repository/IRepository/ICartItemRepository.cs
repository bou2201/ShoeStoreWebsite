using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface ICartItemRepository : IRepository<CartItem>
{
    void Update(CartItem obj);
}