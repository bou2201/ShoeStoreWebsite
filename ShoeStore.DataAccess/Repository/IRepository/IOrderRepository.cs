using ShoeStore.Models;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IOrderRepository : IRepository<ShopOrder>
{
    void Update(ShopOrder obj);
    Task UpdateStatusAsync(int id, string orderStatus, string? paymentStatus = null);
    Task UpdateStripePaymentId(int id, string sessionId, string? paymentIntentId);
}