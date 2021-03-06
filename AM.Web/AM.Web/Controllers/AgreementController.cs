using AM.Web.Data;
using AM.Web.Data.BusinessAccess;
using AM.Web.Data.Entities;
using AM.Web.Models;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace AM.Web.Controllers
{
    [Authorize]
    public class AgreementController : Controller
    {
        private readonly AgreementBusinessAccess _agreement;
        public AgreementController(IMapper mapper, ApplicationDbContext context, UserManager<ApplicationUser> userManager, IHttpContextAccessor contextAccessor)
        {
            _agreement = new AgreementBusinessAccess(context, mapper, contextAccessor);

        }
        // GET: AgreementController
        public ActionResult Index()
        {
            return View(_agreement.GetAgreementsList());
        }

        // GET: AgreementController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: AgreementController/Create
        public ActionResult Create()
        {
            var agreement = new AgreementModel()
            {
                EffectiveDate = DateTime.Now,
                ExpirationDate = DateTime.Now
            };
            agreement.ProductGroupList = _agreement.GetProductGroupList();
            agreement.ProductsList = _agreement.GetProductList();
            return PartialView("AddUpdateAgreement", agreement);
        }

        // POST: AgreementController/Create
        [HttpPost]
        public ActionResult Create(AgreementModel model)
        {
            return Json(_agreement.AddNewAgreement(model));
        }

        // GET: AgreementController/Edit/5
        public ActionResult Edit(int id)
        {
            var agreement = _agreement.GetAgreementById(id);
            if (agreement.EffectiveDate.Equals(DateTime.MinValue))
            {
                agreement.EffectiveDate = DateTime.Now;
            }
            if (agreement.ExpirationDate.Equals(DateTime.MinValue))
            {
                agreement.ExpirationDate = DateTime.Now;
            }
            agreement.ProductGroupList = _agreement.GetProductGroupList();
            agreement.ProductsList = _agreement.GetProductList();
            agreement.ProductsList.Select(x => { x.Selected = agreement.ProductId == x.Value; return x; }).ToList();
            agreement.ProductGroupList.Select(x => { x.Selected = agreement.ProductGroupId == x.Value; return x; }).ToList();
            return PartialView("AddUpdateAgreement", agreement);
        }

        // POST: AgreementController/Edit/5
        [HttpPost]
        public ActionResult Edit(AgreementModel model)
        {
            return Json(_agreement.UpdateAgreement(model));
        }
        [HttpDelete]
        // GET: AgreementController/Delete/5
        public ActionResult Delete(int id)
        {
            return Json(_agreement.DeleteAgreementById(id));
        }

        // POST: AgreementController/Delete/5
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
