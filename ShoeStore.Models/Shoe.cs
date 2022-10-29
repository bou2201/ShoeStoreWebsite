using System.ComponentModel;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace ShoeStore.Models;

public class Shoe
{
    public int Id { get; set; }
    [Required] public string Name { get; set; }
    public int Priority { get; set; }
    public bool Active { get; set; }
    public string? Description { get; set; }
    public string? Features { get; set; }
    public string? Note { get; set; }
    public DateTime Created { get; set; }
    public DateTime Edited { get; set; }
    [DisplayName("Brand")] public int? BrandId { get; set; }
    [ValidateNever] public Brand? Brand { get; set; }
    public int? CategoryId { get; set; }
    [ValidateNever] public Category? Category { get; set; }

    [ValidateNever] public ICollection<ShoeColor>? ShoeColors { get; set; }
}