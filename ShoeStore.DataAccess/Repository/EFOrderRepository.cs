// using Microsoft.EntityFrameworkCore;
// using ShoeStore.Data;
//
// namespace ShoeStore.Models;
//
// public class EfOrderRepository : IOrderRepository
// {
//     private readonly DataContext _context;
//
//     public EfOrderRepository(DataContext ctx)
//     {
//         _context = ctx;
//     }
//
//     public IQueryable<Order> Orders => _context.Orders
//         // .Include(o => o.OrderProducts)
//         // .ThenInclude(l => l.)
//     ;
//
//     public void SaveOrder(Order order)
//     {
//         // _context.AttachRange(order.OrderProducts);
//         if (order.OrderId == 0)
//         {
//             _context.Orders.Add(order);
//         }
//
//         _context.SaveChanges();
//     }
// }