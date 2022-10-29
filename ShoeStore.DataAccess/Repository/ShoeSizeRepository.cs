using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository;

public class ShoeSizeRepository : Repository<ShoeSize>, IShoeSizeRepository
{
    public ShoeSizeRepository(DataContext context) : base(context)
    {
    }

    public void Update(ShoeSize obj)
    {
        _dbSet.Update(obj);
    }
}