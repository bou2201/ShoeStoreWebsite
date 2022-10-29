using System.Linq.Expressions;
using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface ICategoryRepository : IRepository<Category>
{
    void Update(Category obj);

}