using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository;

public class ShoeRepository : Repository<Shoe>, IShoeRepository
{
    public ShoeRepository(DataContext context) : base(context)
    {
    }

    public void Update(Shoe obj)
    {
        _dbSet.Update(obj);
    }
}