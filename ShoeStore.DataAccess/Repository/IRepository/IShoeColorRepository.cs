using ShoeStore.Models;
using ShoeStore.Models.ViewModels;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IShoeColorRepository : IRepository<ShoeColor>
{
    void Update(ShoeColor obj);

    Task<ProductListViewModel> FilterProductAsync(
        int pageSize,
        string? productName,
        int page = 1,
        string? brand = null,
        int? size = null,
        decimal? minPrice = 0,
        decimal? maxPrice = 999, string? sort = "latest");
}