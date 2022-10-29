namespace ShoeStore.Models;

public class Cart
{
    public List<CartItem> CartItemsList { get; set; } = new List<CartItem>();

    public virtual void AddItem(int shoeSizeId, int quantity)
    {
        CartItem? cartItemFromSession = CartItemsList
            .FirstOrDefault(p => p.ShoeSizeId == shoeSizeId);
        if (cartItemFromSession == null)
        {
            CartItemsList.Add(new CartItem
            {
                ShoeSizeId = shoeSizeId,
                Count = quantity
            });
        }
        else
        {
            cartItemFromSession.Count += quantity;
        }
    }

    public virtual void SubtractItem(int shoeSizeId, int quantity)
    {
        CartItem? line = CartItemsList
            .FirstOrDefault(p => p.ShoeSizeId == shoeSizeId);
        if (line != null)
        {
            line.Count -= quantity;
            if (line.Count <= 0)
            {
                RemoveLine(shoeSizeId);
            }
        }
    }

    public virtual void RemoveLine(int shoeSizeId) =>
        CartItemsList.RemoveAll(l => l.ShoeSizeId == shoeSizeId);

    public virtual void Clear() => CartItemsList.Clear();
}