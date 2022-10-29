using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace ShoeStore.Models;

public class Brand
{
    public int Id { get; set; }
    [Required] public string Name { get; set; }

    public int Priority { get; set; }

    public string? Description { get; set; }
    public DateTime Created { get; set; }
    public DateTime Edited { get; set; }

    [ValidateNever] public ICollection<Shoe>? Shoes { get; set; }
}