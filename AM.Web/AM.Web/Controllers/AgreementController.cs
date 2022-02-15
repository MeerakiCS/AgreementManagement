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
        // GET: AgreementController
        public ActionResult Index()
        {
            return View();
        }

        // GET: AgreementController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: AgreementController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AgreementController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
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

        // GET: AgreementController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
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
