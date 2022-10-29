using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace ShoeStore.Models;

public class ShopOrder
{
    public int Id { get; set; }

    // public Guid Code { get; set; }

    public string? ApplicationUserId { get; set; }

    [ForeignKey("ApplicationUserId")]
    [ValidateNever]
    public ApplicationUser? ApplicationUser { get; set; }

    [Required] public DateTime OrderDate { get; set; }
    public DateTime ShippingDate { get; set; }
    public decimal OrderTotal { get; set; }
    public string? OrderStatus { get; set; }
    public string? PaymentStatus { get; set; }
    public string? TrackingNumber { get; set; }
    public string? Carrier { get; set; }

    public DateTime PaymentDate { get; set; }
    public DateTime PaymentDueDate { get; set; }

    public string? SessionId { get; set; }
    public string? PaymentIntentId { get; set; }

    [Required] public string Name { get; set; }
    [Required] [Phone] public string PhoneNumber { get; set; }

    [Required(ErrorMessage = "Please enter the your address")]
    public string Address { get; set; }

    [Required(ErrorMessage = "Please enter a city name")]
    public string City { get; set; }

    [Required(ErrorMessage = "Please enter a district name")]
    public string District { get; set; }

    [Required(ErrorMessage = "Please enter a ward name")]
    public string Ward { get; set; }

    public string? PostalCode { get; set; }

    [ValidateNever] public ICollection<OrderDetail>? OrderDetails { get; set; }
}