using AM.Web.Data.Entities;
using AM.Web.Models;
using AM.Web.Shared;
using AutoMapper;
using Microsoft.AspNetCore.Identity;
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
        private readonly UserManager<ApplicationUser> _userManager;
        public UserBusinessAccess(ApplicationDbContext context, IMapper mapper, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _mapper = mapper;
            _userManager = userManager;
        }

        internal IEnumerable<UserModel> GetAllUsers()
        {
            var users = _context.ApplicationUser.ToList();
            return _mapper.Map<IEnumerable<UserModel>>(users).ToList();
        }
        internal Response CreateUser(UserModel model)
        {
            var respnse = new Response();
            try
            {
                var user = new ApplicationUser
                {
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    Email = model.Email,
                    UserName = model.Email,
                    Active = true
                };
                var existUser = _userManager.FindByEmailAsync(user.Email).Result;
                if (existUser.IsNullOrEmpty())
                {
                    var result = _userManager.CreateAsync(user, model.Password).Result;
                    if (result.Succeeded)
                    {
                        respnse.Success = true;
                        respnse.Type = ResponseType.Success;
                        respnse.Message = "User added successfully";
                    }
                    else
                    {
                        var error = result.Errors.FirstOrDefault().Description;
                        respnse.Type = ResponseType.Warning;
                        respnse.Message = $"Something went wrong. Error: {error}";
                    }
                }
                else
                {
                    respnse.Type = ResponseType.Warning;
                    respnse.Message = "User already exist with same email address.";
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
    }
}
