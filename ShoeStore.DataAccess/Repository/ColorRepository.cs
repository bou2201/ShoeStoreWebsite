using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository;

public class ColorRepository : Repository<Color>, IColorRepository
{
    public ColorRepository(DataContext context) : base(context)
    {
    }

    public void Update(Color obj)
    {
        _dbSet.Update(obj);
    }
}