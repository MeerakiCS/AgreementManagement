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
            var agreements = _context.Agreements.Include(x => x.Product).Include(x => x.ProductGroup).Include(x=>x.User);
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
                   ProductPrice=model.ProductPrice,
                   NewPrice=model.NewPrice,
                   Active=model.Active
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
        public Response UpdateAgreement(AgreementModel model)
        {
            var agreements = _context.Agreements.ToList();
            var productGroup = _context.ProductGroups.ToList();
            var products = _context.Products.ToList();
            var respnse = new Response();
            try
            {
                var isExist = agreements.Where(x => x.Id == model.id).Any();
                 if (isExist)
                {
                    var agreement = agreements.SingleOrDefault(x => x.Id == model.id);
                    agreement.ProductGroup = productGroup.SingleOrDefault(x => x.Id == model.ProductGroupId);
                    agreement.ProductGroup = productGroup.SingleOrDefault(x => x.Id == model.ProductGroupId);
                    agreement.Product = products.SingleOrDefault(x => x.Id == model.ProductId);
                    agreement.EffectiveDate = model.EffectiveDate;
                    agreement.ExpirationDate = model.ExpirationDate;
                    agreement.ProductPrice = model.ProductPrice;
                    agreement.NewPrice = model.NewPrice;
                    agreement.Active = model.Active;
                    _context.Agreements.Update(agreement);
                    _context.SaveChanges();
                    respnse.Success = true;
                    respnse.Type = ResponseType.Success;
                    respnse.Message = "Agreement has been added successfully.";
                }
                else
                {
                    respnse.Success = false;
                    respnse.Type = ResponseType.Warning;
                    respnse.Message = "Agreement not found.";
                }
               
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

        public Response DeleteAgreementById(int id)
        {
            var respnse = new Response();
            var agreements = _context.Agreements.ToList();
            var isExist = agreements.Where(x => x.Id == id).Any();
            if (isExist)
            {
                _context.Remove(agreements.SingleOrDefault(x=>x.Id==id));
                _context.SaveChanges();
                respnse.Success = true;
                respnse.Message = "Agreement has been deleted successfully.";
            }
            else
            {
                respnse.Success = false;
                respnse.Message = "Agreement has been deleted successfully.";
            }
            return respnse;
        }

    }
    }
