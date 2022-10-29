using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository;

public class SizeRepository : Repository<Size>, ISizeRepository
{
    public SizeRepository(DataContext context) : base(context)
    {
    }

    public void Update(Size obj)
    {
        _dbSet.Update(obj);
    }
}