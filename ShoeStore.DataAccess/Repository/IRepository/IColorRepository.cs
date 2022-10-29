using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IColorRepository : IRepository<Color>
{
    void Update(Color obj);
}