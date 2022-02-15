using System;

namespace AM.Web.Data.Entities
{
    public class Agreement
    {
        public int Id { get; set; }
        public ApplicationUser User { get; set; }
        public ProductGroup ProductGroup { get; set; }
        public Product Product { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime ExpirationDate { get; set; }
        public decimal ProductPrice { get; set; }
        public decimal NewPrice { get; set; }
    }
}
