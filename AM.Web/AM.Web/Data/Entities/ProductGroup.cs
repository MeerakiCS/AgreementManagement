namespace AM.Web.Data.Entities
{
    public class ProductGroup
    {
        public ProductGroup() { Active = true; }
        public int id { get; set; }
        public string GroupDescription { get; set; }
        public string GroupCode { get; set; }
        public bool Active { get; set; }
    }
}
