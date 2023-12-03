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
    public class PropertyOwnersController : Controller
    {
        private PropertyRentalManagementEntities db = new PropertyRentalManagementEntities();

        // GET: PropertyOwners
        public ActionResult Index()
        {
            var propertyOwners = db.PropertyOwners.Include(p => p.Building).Include(p => p.User);
            return View(propertyOwners.ToList());
        }

        // GET: PropertyOwners/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertyOwner propertyOwner = db.PropertyOwners.Find(id);
            if (propertyOwner == null)
            {
                return HttpNotFound();
            }
            return View(propertyOwner);
        }

        // GET: PropertyOwners/Create
        public ActionResult Create()
        {
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Address");
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username");
            return View();
        }

        // POST: PropertyOwners/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OwnerID,UserID,BuildingID")] PropertyOwner propertyOwner)
        {
            if (ModelState.IsValid)
            {
                db.PropertyOwners.Add(propertyOwner);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Address", propertyOwner.BuildingID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", propertyOwner.UserID);
            return View(propertyOwner);
        }

        // GET: PropertyOwners/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertyOwner propertyOwner = db.PropertyOwners.Find(id);
            if (propertyOwner == null)
            {
                return HttpNotFound();
            }
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Address", propertyOwner.BuildingID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", propertyOwner.UserID);
            return View(propertyOwner);
        }

        // POST: PropertyOwners/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OwnerID,UserID,BuildingID")] PropertyOwner propertyOwner)
        {
            if (ModelState.IsValid)
            {
                db.Entry(propertyOwner).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Address", propertyOwner.BuildingID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", propertyOwner.UserID);
            return View(propertyOwner);
        }

        // GET: PropertyOwners/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertyOwner propertyOwner = db.PropertyOwners.Find(id);
            if (propertyOwner == null)
            {
                return HttpNotFound();
            }
            return View(propertyOwner);
        }

        // POST: PropertyOwners/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PropertyOwner propertyOwner = db.PropertyOwners.Find(id);
            db.PropertyOwners.Remove(propertyOwner);
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
