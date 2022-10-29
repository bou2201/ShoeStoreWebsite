using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace ShoeStore.Models;

public class Image
{
    public int Id { get; set; }
    [Required] public string? Path { get; set; }
    [Required]
    public int SortOrder { get; set; }

    public int ShoeColorId { get; set; }
    [ValidateNever] public ShoeColor? ShoeColor { get; set; }
}