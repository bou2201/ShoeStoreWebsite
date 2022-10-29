using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IBrandRepository : IRepository<Brand>
{
    void Update(Brand obj);
}