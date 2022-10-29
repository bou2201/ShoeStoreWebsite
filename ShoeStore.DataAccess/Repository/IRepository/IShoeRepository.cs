using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IShoeRepository : IRepository<Shoe>
{
    void Update(Shoe obj);
}