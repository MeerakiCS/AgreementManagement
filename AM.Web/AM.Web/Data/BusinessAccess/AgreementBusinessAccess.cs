using AM.Web.Data.Entities;
using AM.Web.Models;
using AM.Web.Shared;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace AM.Web.Data.BusinessAccess
{
    public class AgreementBusinessAccess
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _context;
        private readonly ApplicationUser _user;

        public AgreementBusinessAccess(ApplicationDbContext context, IMapper mapper, IHttpContextAccessor contextAccessor)
        {
            _context = context;
            _mapper = mapper;
            var currentUser = contextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            if (currentUser != null)
            {
                _user = _context.ApplicationUser.FirstOrDefault(x => x.Id.Equals(currentUser.Value));
            }
        }
        public IEnumerable<AgreementModel> GetAgreementsList()
        {
            var agreements = _context.Agreements.Include(x => x.Product).Include(x => x.ProductGroup).Include(x=>x.User);
            return _mapper.Map<IEnumerable<AgreementModel>>(agreements).ToList();
        }

        public List<SelectModel> GetProductGroupList()
        {
            return _context.ProductGroups.Where(x => x.Active).Select(x => new SelectModel
            {
                Text = x.GroupDescription,
                Value = x.Id
            }).ToList();
        }

        public List<SelectModel> GetProductList()
        {
            return _context.Products.Where(x => x.Active).Select(x => new SelectModel
            {
                Text = x.ProductDescription,
                Value = x.Id
            }).ToList();

        }

        public Response AddNewAgreement(AgreementModel model)
        {
            var respnse = new Response();
            try
            {
                model.EffectiveDate = DateTime.ParseExact(model.EffectiveDateString, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                model.ExpirationDate = DateTime.ParseExact(model.ExpirationDateString, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                var agreement = new Agreement
                {
                    ProductGroup = _context.ProductGroups.SingleOrDefault(x => x.Id == model.ProductGroupId),
                    Product = _context.Products.SingleOrDefault(x => x.Id == model.ProductId),
                    EffectiveDate = model.EffectiveDate,
                    ExpirationDate = model.ExpirationDate,
                    ProductPrice = model.ProductPrice,
                    NewPrice = model.NewPrice,
                    Active = model.Active,
                    User = _user
                };
                _context.Agreements.Add(agreement);
                _context.SaveChanges();
                respnse.Success = true;
                respnse.Type = ResponseType.Success;
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
            var respnse = new Response();
            try
            {
                model.EffectiveDate = DateTime.ParseExact(model.EffectiveDateString, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                model.ExpirationDate = DateTime.ParseExact(model.ExpirationDateString, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                var agreement = _context.Agreements.SingleOrDefault(x => x.Id == model.Id);
                if (agreement.IsNotNullOrEmpty())
                {
                    agreement.ProductGroup = _context.ProductGroups.SingleOrDefault(x => x.Id == model.ProductGroupId);
                    agreement.Product = _context.Products.SingleOrDefault(x => x.Id == model.ProductId);
                    agreement.EffectiveDate = model.EffectiveDate;
                    agreement.ExpirationDate = model.ExpirationDate;
                    agreement.ProductPrice = model.ProductPrice;
                    agreement.NewPrice = model.NewPrice;
                    agreement.User = _user;
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
                _context.Remove(agreements.SingleOrDefault(x => x.Id == id));
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
