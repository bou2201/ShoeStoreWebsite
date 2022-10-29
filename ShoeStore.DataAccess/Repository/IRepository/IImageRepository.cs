using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IImageRepository : IRepository<Image>
{
    void Update(Image obj);
}