using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository;

public class ImageRepository : Repository<Image>, IImageRepository
{
    public ImageRepository(DataContext context) : base(context)
    {
    }

    public void Update(Image obj)
    {
        _dbSet.Update(obj);
    }
}