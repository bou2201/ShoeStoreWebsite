using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace ShoeStore.Models;

public class OrderDetail
{
    public int Id { get; set; }

    [Required] public int OrderId { get; set; }

    [ValidateNever]
    [ForeignKey("OrderId")]
    public ShopOrder ShopOrder { get; set; }

    [Required] public int ShoeSizeId { get; set; }

    [ForeignKey("ShoeSizeId")]
    [ValidateNever]
    public ShoeSize ShoeSize { get; set; }

    public int Count { get; set; }
    public decimal PriceEach { get; set; }
}