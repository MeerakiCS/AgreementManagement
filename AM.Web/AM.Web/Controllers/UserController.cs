using AM.Web.Data;
using AM.Web.Data.BusinessAccess;
using AM.Web.Data.Entities;
using AM.Web.Models;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace AM.Web.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        private readonly UserBusinessAccess _user;
        public UserController(ApplicationDbContext context, IMapper mapper, UserManager<ApplicationUser> userManager)
        {
            _user = new UserBusinessAccess(context, mapper, userManager);
         
        }
        // GET: UserController
        public ActionResult Index()
        {
            var users = _user.GetAllUsers();
            return View(users);
        }

        // GET: UserController/Create
        public ActionResult Create()
        {
            var model = new UserModel();
            return PartialView("AddEditUser", model);
        }

        // POST: UserController/Create
        [HttpPost]
        public ActionResult Create(UserModel model)
        {
            return Json(_user.CreateUser(model));
        }
    }
}
