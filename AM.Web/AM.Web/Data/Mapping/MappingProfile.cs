using AM.Web.Data.Entities;
using AM.Web.Models;
using AutoMapper;

namespace AM.Web.Data.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<ApplicationUser, UserModel>();
            CreateMap<Agreement, AgreementModel>();
            CreateMap<Product, ProductModel>();
            CreateMap<ProductGroup, ProductGroupModel>();
        }
    }
}
