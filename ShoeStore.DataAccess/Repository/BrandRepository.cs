using Microsoft.EntityFrameworkCore;
using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository;

public class BrandRepository : Repository<Brand>, IBrandRepository
{
    public BrandRepository(DataContext context) : base(context)
    {
    }

    public void Update(Brand obj)
    {
        _dbSet.Update(obj);
    }

}