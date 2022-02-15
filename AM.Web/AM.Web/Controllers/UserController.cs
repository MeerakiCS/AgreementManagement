using AM.Web.Data;
using AM.Web.Data.BusinessAccess;
using AM.Web.Models;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AM.Web.Controllers
{
    public class UserController : Controller
    {
        private readonly UserBusinessAccess _user;
        public UserController(ApplicationDbContext context, IMapper mapper)
        {
            _user = new UserBusinessAccess(context, mapper);
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
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: UserController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: UserController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: UserController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: UserController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
