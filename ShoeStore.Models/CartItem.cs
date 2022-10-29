using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace ShoeStore.Models;

public class CartItem
{
    public int Id { get; set; }
    [Required, Range(1, int.MaxValue)] public int ShoeSizeId { get; set; }

    [ValidateNever]
    [ForeignKey("ShoeSizeId")]
    public ShoeSize ShoeSize { get; set; }

    [Range(1, 999)] public int Count { get; set; }
    public decimal PriceEach { get; set; }

    public string? ApplicationUserId { get; set; }

    [ForeignKey("ApplicationUserId")]
    [ValidateNever]
    public ApplicationUser? ApplicationUser { get; set; }
}