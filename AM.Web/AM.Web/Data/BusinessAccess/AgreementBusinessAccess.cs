using AM.Web.Models;
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
            var groups = _context.ProductGroups.Where(x => x.Active).Select(x => new SelectModel
            {
                Text = x.GroupDescription,
                Value = x.Id
            }).ToList();
            return groups;
        }

        public IEnumerable<SelectModel> GetProductList()
        {
            var products = _context.Products.Where(x => x.Active).Select(x => new SelectModel
            {
                Text = x.ProductDescription,
                Value = x.Id
            });
            return products;
        }

    }
    }
