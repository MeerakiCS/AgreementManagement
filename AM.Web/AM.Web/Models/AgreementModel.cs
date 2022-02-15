using System;
using System.Collections.Generic;

namespace AM.Web.Models
{
    public class AgreementModel
    {
        public int Id { get; set; }
        public UserModel User { get; set; }
        public ProductGroupModel ProductGroup { get; set; }
        public int ProductGroupId { get; set; }
        public ProductModel Product { get; set; }
        public int ProductId { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime ExpirationDate { get; set; }
        public string EffectiveDateString { get; set; }
        public string ExpirationDateString { get; set; }
        public decimal ProductPrice { get; set; }
        public decimal NewPrice { get; set; }
        public List<SelectModel> ProductGroupList { get; set; }
        public List<SelectModel> ProductsList { get; set; }
        public bool Active { get; set; }
    }
}
