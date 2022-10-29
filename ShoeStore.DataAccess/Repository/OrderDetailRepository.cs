using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository;

public class OrderDetailRepository : Repository<OrderDetail>, IOrderDetailRepository
{
    public OrderDetailRepository(DataContext context) : base(context)
    {
    }

    public void Update(OrderDetail obj)
    {
        _dbSet.Update(obj);
    }
}