using System.Text.Json.Serialization;
using ShoeStore.Models;

namespace ShoeStore.Infrastructure;

public class SessionCart : Cart
{
    public static Cart GetCart(IServiceProvider services)
    {
        ISession? session = services.GetRequiredService<IHttpContextAccessor>()
            .HttpContext?.Session;
        SessionCart cart = session?.GetJson<SessionCart>("Cart")
                           ?? new SessionCart();
        cart.Session = session;
        return cart;
    }

    [JsonIgnore] public ISession? Session { get; set; }

    public override void AddItem(int shoeSizeId, int quantity)
    {
        base.AddItem(shoeSizeId, quantity);
        Session?.SetJson("Cart", this);
    }

    public override void SubtractItem(int shoeSizeId, int quantity)
    {
        base.SubtractItem(shoeSizeId, quantity);
        Session?.SetJson("Cart", this);
    }

    public override void RemoveLine(int shoeSizeId)
    {
        base.RemoveLine(shoeSizeId);
        Session?.SetJson("Cart", this);
    }

    public override void Clear()
    {
        base.Clear();
        Session?.Remove("Cart");
    }
}