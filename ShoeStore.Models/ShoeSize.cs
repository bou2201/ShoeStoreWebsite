using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace ShoeStore.Models;

public class ShoeSize
{
    public int Id { get; set; }
    [Required] public int Quantity { get; set; }
    [Required] public int ShoeColorId { get; set; }

    [ForeignKey("ShoeColorId")]
    [ValidateNever]
    public ShoeColor ShoeColor { get; set; }

    [Required] public int SizeId { get; set; }
    [ForeignKey("SizeId")] [ValidateNever] public Size Size { get; set; }

    [ValidateNever] public IEnumerable<OrderDetail>? OrderDetails { get; set; }
}