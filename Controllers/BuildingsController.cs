using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject_PropertyManagement.Models;

namespace FinalProject_PropertyManagement.Controllers
{
    public class BuildingsController : Controller
    {
        private PropertyRentalManagementEntities db = new PropertyRentalManagementEntities();

        // GET: Buildings
        public ActionResult Index(string searchBy, string search)
        {
            try
            {
                if (Session["UserType"] == null || string.Equals(Session["UserType"]?.ToString(), "3", StringComparison.OrdinalIgnoreCase))
                {
                    return RedirectToAction("Login", "Accounts");
                }
            }
            catch
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (!String.IsNullOrEmpty(search))
            {
                if (searchBy == "Address")
                {
                    return View(db.Buildings.Where(x => x.Address.Contains(search) || search == null).ToList());
                }
                if (searchBy == "City")
                {
                    return View(db.Buildings.Where(x => x.City.Contains(search) || search == null).ToList());
                }
                if (searchBy == "State")
                {
                    return View(db.Buildings.Where(x => x.State.Contains(search) || search == null).ToList());
                }
                if (searchBy == "ZipCode")
                {
                    return View(db.Buildings.Where(x => x.ZipCode.Contains(search) || search == null).ToList());
                }
            }
            
            return View(db.Buildings.ToList());
        }

        // GET: Buildings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Building building = db.Buildings.Find(id);
            if (building == null)
            {
                return HttpNotFound();
            }
            return View(building);
        }

        // GET: Buildings/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Buildings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BuildingID,Address,City,State,ZipCode")] Building building)
        {
            if (ModelState.IsValid)
            {
                db.Buildings.Add(building);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(building);
        }

        // GET: Buildings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Building building = db.Buildings.Find(id);
            if (building == null)
            {
                return HttpNotFound();
            }
            return View(building);
        }

        // POST: Buildings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BuildingID,Address,City,State,ZipCode")] Building building)
        {
            if (ModelState.IsValid)
            {
                db.Entry(building).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(building);
        }

        // GET: Buildings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Building building = db.Buildings.Find(id);
            if (building == null)
            {
                return HttpNotFound();
            }
            return View(building);
        }

        // POST: Buildings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Building building = db.Buildings.Find(id);
            db.Buildings.Remove(building);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
