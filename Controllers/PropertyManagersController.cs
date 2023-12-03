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
    public class PropertyManagersController : Controller
    {
        private PropertyRentalManagementEntities db = new PropertyRentalManagementEntities();

        // GET: PropertyManagers
        public ActionResult Index()
        {
            var propertyManagers = db.PropertyManagers.Include(p => p.Building).Include(p => p.User);
            return View(propertyManagers.ToList());
        }

        // GET: PropertyManagers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertyManager propertyManager = db.PropertyManagers.Find(id);
            if (propertyManager == null)
            {
                return HttpNotFound();
            }
            return View(propertyManager);
        }

        // GET: PropertyManagers/Create
        public ActionResult Create()
        {
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Address");
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username");
            return View();
        }

        // POST: PropertyManagers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ManagerID,UserID,BuildingID")] PropertyManager propertyManager)
        {
            if (ModelState.IsValid)
            {
                db.PropertyManagers.Add(propertyManager);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Address", propertyManager.BuildingID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", propertyManager.UserID);
            return View(propertyManager);
        }

        // GET: PropertyManagers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertyManager propertyManager = db.PropertyManagers.Find(id);
            if (propertyManager == null)
            {
                return HttpNotFound();
            }
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Address", propertyManager.BuildingID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", propertyManager.UserID);
            return View(propertyManager);
        }

        // POST: PropertyManagers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ManagerID,UserID,BuildingID")] PropertyManager propertyManager)
        {
            if (ModelState.IsValid)
            {
                db.Entry(propertyManager).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Address", propertyManager.BuildingID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", propertyManager.UserID);
            return View(propertyManager);
        }

        // GET: PropertyManagers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertyManager propertyManager = db.PropertyManagers.Find(id);
            if (propertyManager == null)
            {
                return HttpNotFound();
            }
            return View(propertyManager);
        }

        // POST: PropertyManagers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PropertyManager propertyManager = db.PropertyManagers.Find(id);
            db.PropertyManagers.Remove(propertyManager);
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
