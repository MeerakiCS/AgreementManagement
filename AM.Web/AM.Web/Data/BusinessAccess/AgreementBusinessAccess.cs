using AM.Web.Data.Entities;
using AM.Web.Models;
using AM.Web.Shared;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AM.Web.Data.BusinessAccess
{
    public class AgreementBusinessAccess
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _context;

        public AgreementBusinessAccess(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public IEnumerable<AgreementModel> GetAgreementsList()
        {
            var agreements = _context.Agreements.Include(x => x.Product).Include(x => x.ProductGroup);
            return _mapper.Map<IEnumerable<AgreementModel>>(agreements).ToList();
        }

        public List<SelectModel> GetProductGroupList()
        {
            return  _context.ProductGroups.Where(x => x.Active).Select(x => new SelectModel
            {
                Text = x.GroupDescription,
                Value = x.Id
            }).ToList();
        }

        public List<SelectModel> GetProductList()
        {
            return  _context.Products.Where(x => x.Active).Select(x => new SelectModel
            {
                Text = x.ProductDescription,
                Value = x.Id
            }).ToList();
            
        }

        public Response AddNewAgreement(AgreementModel model)
        {
            var productGroup = _context.ProductGroups.ToList();
            var products = _context.Products.ToList();
            var respnse = new Response();
            try
            {
                var agreement = new Agreement
                {
                    ProductGroup = productGroup.SingleOrDefault(x=>x.Id==model.ProductGroupId),
                    Product = products.SingleOrDefault(x=>x.Id==model.ProductId),
                   EffectiveDate=model.EffectiveDate,
                   ExpirationDate=model.ExpirationDate,
                   ProductPrice=model.ProductPrice
                };
                _context.Agreements.Add(agreement);
                _context.SaveChanges();
                respnse.Success = true;
                respnse.Type= ResponseType.Success;
                respnse.Message = "Agreement has been added successfully!";
            }
            catch (Exception ex)
            {
                respnse.Exception = ex.InnerException.IsNotNullOrEmpty() ? ex.InnerException.Message : ex.Message;
                respnse.Type = ResponseType.Error;
                respnse.Message = $"Something went wrong. Error: {respnse.Exception}";
            }

            return respnse;
        }

        public AgreementModel GetAgreementById(int id)
        {
            var agreement = _context.Agreements.Include(x => x.ProductGroup).Include(x => x.Product).SingleOrDefault(x => x.Id == id);
            return _mapper.Map<AgreementModel>(agreement);
        }



    }
    }
