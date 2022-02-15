using AM.Web.Data;
using AM.Web.Data.BusinessAccess;
using AM.Web.Models;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AM.Web.Controllers
{
    public class AgreementController : Controller
    {
        private readonly AgreementBusinessAccess _agreement;
        public AgreementController(IMapper mapper, ApplicationDbContext context)
        {
            _agreement = new AgreementBusinessAccess(context, mapper);

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
            var agreement = new AgreementModel();
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
           
            agreement.ProductGroupList = _agreement.GetProductGroupList();
            agreement.ProductsList = _agreement.GetProductList();
            return PartialView("AddUpdateAgreement", agreement);
        }

        // POST: AgreementController/Edit/5
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

        // GET: AgreementController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
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
