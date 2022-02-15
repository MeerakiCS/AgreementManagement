using AM.Web.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AM.Web.Data.BusinessAccess
{

    public class UserBusinessAccess
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper _mapper;
        public UserBusinessAccess(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        internal IEnumerable<UserModel> GetAllUsers()
        {
            var users = _context.ApplicationUser.ToList();
            return _mapper.Map<IEnumerable<UserModel>>(users).ToList();
        }
    }
}
