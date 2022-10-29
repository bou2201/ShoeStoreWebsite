using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace ShoeStore.Models;

public class Category
{
    public int Id { get; set; }

    [Required] public string Name { get; set; } = String.Empty;

    public string? DisplayName { get; set; }
    public string? Description { get; set; }

    public int? ParentId { get; set; }
    [ValidateNever] public Category? Parent { get; set; }

    public IEnumerable<Category>? Children { get; set; }

    [ValidateNever] public ICollection<Shoe>? Shoes { get; set; }
}