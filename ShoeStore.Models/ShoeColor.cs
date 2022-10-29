using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace ShoeStore.Models;

public class ShoeColor
{
    public int Id { get; set; }
    public string? ProductCode { get; set; }

    [Column(TypeName = "decimal(10, 2)")] public decimal FactoryPrice { get; set; }

    [Column(TypeName = "decimal(10, 2)")] public decimal SalePrice { get; set; }

    public int SortOrder { get; set; }
    public int Priority { get; set; } = 1;
    public bool Active { get; set; }
    public string? Url { get; set; }
    public DateTime Created { get; set; }
    public DateTime Edited { get; set; }

    public int ShoeId { get; set; }
    [ValidateNever] public Shoe? Shoe { get; set; }
    public int ColorId { get; set; }
    [ValidateNever] public Color? Color { get; set; }

    [ValidateNever] public IEnumerable<ShoeSize>? ShoeSizes { get; set; }
    [ValidateNever] public IEnumerable<Image>? Images { get; set; }
}