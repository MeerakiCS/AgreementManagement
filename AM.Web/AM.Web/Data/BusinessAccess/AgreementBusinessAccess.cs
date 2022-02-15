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

        public AgreementBusinessAccess(ApplicationDbContext context,IMapper mapper )
        {
            _context = context;
            _mapper = mapper;
        }
        public IEnumerable<AgreementModel> GetAgreementsList()
        {
            var agreements = _context.Agreements.Include(x => x.Product).Include(x=>x.ProductGroup);
            return _mapper.Map<IEnumerable<AgreementModel>>(agreements).ToList();
        }
    }
}
