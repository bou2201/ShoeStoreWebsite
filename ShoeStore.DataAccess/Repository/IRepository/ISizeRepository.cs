using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface ISizeRepository : IRepository<Size>
{
    void Update(Size obj);
}