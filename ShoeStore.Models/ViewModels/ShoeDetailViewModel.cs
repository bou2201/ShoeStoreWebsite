namespace ShoeStore.Models.ViewModels
{
    public class ShoeDetailViewModel
    {
        public IEnumerable<Shoe> Shoes { get; set; }
        public IEnumerable<ShoeColor> ShoeColors { get; set; }
    }
}
