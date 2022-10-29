using System.Linq.Expressions;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;
using ShoeStore.Models;
using ShoeStore.Models.ViewModels;

namespace ShoeStore.DataAccess.Repository;

public class ShoeColorRepository : Repository<ShoeColor>, IShoeColorRepository
{
    public ShoeColorRepository(DataContext context) : base(context)
    {
    }

    public void Update(ShoeColor obj)
    {
        _dbSet.Update(obj);
    }

    public async Task<ProductListViewModel> FilterProductAsync(int pageSize,
        string? productName = null, int page = 1, string? brand = null,
        int? size = null,
        decimal? minPrice = null, decimal? maxPrice = null, string? sort = "latest")
    {
        var shoeQuery = _context.Shoes
            .Include(e => e.Brand)
            .Select(e => new
            {
                ShoeId = e.Id,
                Name = e.Name,
                BrandName = e.Brand!.Name
            });
        if (brand != null)
        {
            shoeQuery = shoeQuery.Where(e => e.BrandName == brand);
        }

        if (productName != null)
        {
            shoeQuery = shoeQuery.Where(e => EF.Functions.Like(e.Name, $"%{productName.Trim()}%"));
        }

        var shoeColorsQuery = _context.ShoeColor
            .Where(e => e.Active == true)
            .Include(e => e.Images)
            .Include(e => e.ShoeSizes)
            .Select(e => new
            {
                ShoeId = e.ShoeId,
                ShoeSizes = e.ShoeSizes,
                Price = e.SalePrice,
                ImagePath = e.Images.First().Path,
                Url = e.Url,
                Created = e.Created
            });

        if (size != null)
        {
            shoeColorsQuery = shoeColorsQuery.Where(e => e.ShoeSizes.Any(e => e.Size.Value == size));
        }

        ;
        if (maxPrice != null)
        {
            shoeColorsQuery = shoeColorsQuery.Where(e => e.Price <= maxPrice);
        }

        IQueryable<ProductCardViewModel> productCardViewModels = from shoeColor in shoeColorsQuery
            join shoe in shoeQuery
                on shoeColor.ShoeId equals shoe.ShoeId
            select new ProductCardViewModel()
            {
                Name = shoe.Name, Price = shoeColor.Price, Url = shoeColor.Url, BrandName = shoe.BrandName,
                ImagePath = shoeColor.ImagePath, Created = shoeColor.Created
            };

        switch (sort)
        {
            case "lowest":
                productCardViewModels = productCardViewModels.OrderBy(e => e.Price);
                break;
            case "highest":
                productCardViewModels = productCardViewModels.OrderBy(e => e.Price).Reverse();
                break;
            default:
                sort = "latest";
                productCardViewModels = productCardViewModels.OrderBy(e => e.Created);
                break;
        }

        List<ProductCardViewModel> productCards = await productCardViewModels.ToListAsync();

        var brands = await _context.Brands.AsNoTracking().OrderBy(e => e.Name).ToListAsync();
        var sizes = await _context.Sizes.AsNoTracking().OrderBy(e => e.Value).ToListAsync();

        ProductListViewModel productListViewModel = new ProductListViewModel()
        {
            Brands = brands,
            Sizes = sizes,
            // ShoeColors = shoeColors,
            ProductCards = productCards
                .Skip(pageSize * (page - 1))
                .Take(pageSize)
                .ToList(),
            SelectedBrandId = (brands.FirstOrDefault(e => e.Name == brand))?.Id,
            SelectedSizeId = (sizes.FirstOrDefault(e => e.Value.ToString() == size.ToString()))?.Id,
            PagingInfo = new PagingInfo()
            {
                CurrentPage = page,
                ItemsPerPage = pageSize,
                TotalItems = productCards.Count
            },
            CurrentBrand = brand
        };

        if (maxPrice != null)
        {
            productListViewModel.maxPrice = maxPrice;
        }

        productListViewModel.SearchedBrand = brand;

        List<SelectListItem> selectListItems = new List<SelectListItem>()
        {
            new SelectListItem("Latest", "latest"),
            new SelectListItem("Price: Low to high", "lowest"),
            new SelectListItem("Price: High to low", "highest"),
        };
        for (int i = 0; i < selectListItems.Count; i++)
        {
            SelectListItem opt = selectListItems[i];
            if (opt.Value == sort)
            {
                opt.Selected = true;
                break;
            }
        }

        productListViewModel.SelectListItems = selectListItems;


        return productListViewModel;
    }
    
    // public async Task<ProductListViewModel> FilterProductAsync(int pageSize,
    //     string? productName = null, int page = 1, string? brand = null,
    //     int? size = null,
    //     decimal? minPrice = null, decimal? maxPrice = null, string? sort = "latest")
    // {
    //     var shoeQuery = _context.Shoes
    //         .Include(e => e.Brand)
    //         .Select(e => new
    //         {
    //             ShoeId = e.Id,
    //             Name = e.Name,
    //             BrandName = e.Brand!.Name
    //         });
    //     if (brand != null)
    //     {
    //         shoeQuery = shoeQuery.Where(e => e.BrandName == brand);
    //     }
    //
    //     if (productName != null)
    //     {
    //         shoeQuery = shoeQuery.Where(e => EF.Functions.Like(e.Name, $"%{productName.Trim()}%"));
    //     }
    //
    //     var shoeColorsQuery = _context.ShoeColor
    //         .Include(e => e.Images)
    //         .Include(e => e.ShoeSizes)
    //         .Select(e => new
    //         {
    //             ShoeId = e.ShoeId,
    //             ShoeSizes = e.ShoeSizes,
    //             Price = e.SalePrice,
    //             ImagePath = e.Images.First().Path,
    //             Url = e.Url,
    //             Created = e.Created
    //         });
    //
    //     if (size != null)
    //     {
    //         shoeColorsQuery = shoeColorsQuery.Where(e => e.ShoeSizes.Any(e => e.Size.Value == size));
    //     }
    //
    //     ;
    //     if (maxPrice != null)
    //     {
    //         shoeColorsQuery = shoeColorsQuery.Where(e => e.Price <= maxPrice);
    //     }
    //
    //     IQueryable<ProductCardViewModel> productCardViewModels = from shoeColor in shoeColorsQuery
    //         join shoe in shoeQuery
    //             on shoeColor.ShoeId equals shoe.ShoeId
    //         select new ProductCardViewModel()
    //         {
    //             Name = shoe.Name, Price = shoeColor.Price, Url = shoeColor.Url, BrandName = shoe.BrandName,
    //             ImagePath = shoeColor.ImagePath, Created = shoeColor.Created
    //         };
    //
    //     switch (sort)
    //     {
    //         case "lowest":
    //             productCardViewModels = productCardViewModels.OrderBy(e => e.Price);
    //             break;
    //         case "highest":
    //             productCardViewModels = productCardViewModels.OrderBy(e => e.Price).Reverse();
    //             break;
    //         default:
    //             sort = "latest";
    //             productCardViewModels = productCardViewModels.OrderBy(e => e.Created);
    //             break;
    //     }
    //
    //     List<ProductCardViewModel> productCards = await productCardViewModels.ToListAsync();
    //
    //     var brands = await _context.Brands.AsNoTracking().OrderBy(e => e.Name).ToListAsync();
    //     var sizes = await _context.Sizes.AsNoTracking().OrderBy(e => e.Value).ToListAsync();
    //
    //     ProductListViewModel productListViewModel = new ProductListViewModel()
    //     {
    //         Brands = brands,
    //         Sizes = sizes,
    //         // ShoeColors = shoeColors,
    //         ProductCards = productCards
    //             .Skip(pageSize * (page - 1))
    //             .Take(pageSize)
    //             .ToList(),
    //         SelectedBrandId = (brands.FirstOrDefault(e => e.Name == brand))?.Id,
    //         SelectedSizeId = (sizes.FirstOrDefault(e => e.Value.ToString() == size.ToString()))?.Id,
    //         PagingInfo = new PagingInfo()
    //         {
    //             CurrentPage = page,
    //             ItemsPerPage = pageSize,
    //             TotalItems = productCards.Count
    //         },
    //         CurrentBrand = brand
    //     };
    //
    //     if (maxPrice != null)
    //     {
    //         productListViewModel.maxPrice = maxPrice;
    //     }
    //
    //     productListViewModel.SearchedBrand = brand;
    //
    //     List<SelectListItem> selectListItems = new List<SelectListItem>()
    //     {
    //         new SelectListItem("Latest", "latest"),
    //         new SelectListItem("Price: Low to high", "lowest"),
    //         new SelectListItem("Price: High to low", "highest"),
    //     };
    //     for (int i = 0; i < selectListItems.Count; i++)
    //     {
    //         SelectListItem opt = selectListItems[i];
    //         if (opt.Value == sort)
    //         {
    //             opt.Selected = true;
    //             break;
    //         }
    //     }
    //
    //     productListViewModel.SelectListItems = selectListItems;
    //
    //
    //     return productListViewModel;
    // }
}