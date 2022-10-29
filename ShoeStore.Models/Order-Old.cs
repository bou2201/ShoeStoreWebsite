// using System.ComponentModel.DataAnnotations;
// using Microsoft.AspNetCore.Mvc.ModelBinding;
//
// namespace ShoeStore.Models;
//
// public class Order
// {
//     [BindNever] public int OrderId { get; set; }
//     // [BindNever] public ICollection<CartItem> OrderProducts { get; set; } = new List<CartItem>();
//
//     [Required(ErrorMessage = "Please enter a name")]
//     public string? Name { get; set; }
//
//     [Required(ErrorMessage = "Please enter phone number")]
//     [Phone]
//     public string? Phone { get; set; }
//
//     [Required(ErrorMessage = "Please enter the your address")]
//     public string? Address { get; set; }
//
//     [Required(ErrorMessage = "Please enter a city name")]
//     public string? City { get; set; }
//
//     [Required(ErrorMessage = "Please enter a district name")]
//     public string? District { get; set; }
//
//     [Required(ErrorMessage = "Please enter a street name")]
//     public string? Ward { get; set; }
//
//     public string? Zip { get; set; }
//
//     public string? AdditionalInfo { get; set; }
//
// }