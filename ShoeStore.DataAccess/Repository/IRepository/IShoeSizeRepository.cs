using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IShoeSizeRepository : IRepository<ShoeSize>
{
    void Update(ShoeSize obj);
}