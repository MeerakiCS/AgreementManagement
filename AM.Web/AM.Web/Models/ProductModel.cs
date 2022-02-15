namespace AM.Web.Models
{
    public class ProductModel
    {
        public int Id { get; set; }
        public ProductGroupModel ProductGroup { get; set; }
        public string ProductDescription { get; set; }
        public string ProductNumber { get; set; }
        public decimal Price { get; set; }
        public bool Active { get; set; }
    }
}
