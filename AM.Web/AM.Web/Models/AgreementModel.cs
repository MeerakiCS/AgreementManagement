using System;

namespace AM.Web.Models
{
    public class AgreementModel
    {
        public int id { get; set; }
        public UserModel User { get; set; }
        public ProductGroupModel ProductGroup { get; set; }
        public ProductModel Product { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime ExpirationDate { get; set; }
        public decimal ProductPrice { get; set; }
        public decimal NewPrice { get; set; }
    }
}
