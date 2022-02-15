namespace AM.Web.Data.Entities
{
    public class Product
    {
        public Product() { Active = true; }
        public int Id { get; set; }
        public ProductGroup ProductGroup { get; set; }
        public string ProductDescription { get; set; }
        public string ProductNumber { get; set; }
        public decimal Price { get; set; }
        public bool Active { get; set; }
    }
}
