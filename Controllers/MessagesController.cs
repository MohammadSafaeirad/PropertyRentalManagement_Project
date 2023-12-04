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
    public class MessagesController : Controller
    {
        private PropertyRentalManagementEntities db = new PropertyRentalManagementEntities();

        // GET: Messages
        public ActionResult Index()
        {
            try
            {
                if (Session["UserType"] == null)
                {
                    return RedirectToAction("Login", "Accounts");
                }
            }
            catch
            {
                return RedirectToAction("Login", "Accounts");
            }
            var messages = db.Messages.Include(m => m.PropertyManager).Include(m => m.Tenant);
            return View(messages.ToList());
        }

        // GET: Messages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Message message = db.Messages.Find(id);
            if (message == null)
            {
                return HttpNotFound();
            }
            return View(message);
        }

        // GET: Messages/Create
        public ActionResult Create()
        {
            ViewBag.ManagerID = new SelectList(db.PropertyManagers, "ManagerID", "ManagerID");
            ViewBag.TenantID = new SelectList(db.Tenants, "TenantID", "TenantID");
            return View();
        }

        // POST: Messages/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MessageID,ManagerID,TenantID,MessageBody,DateSent,Sender")] Message message)
        {
            if (ModelState.IsValid)
            {
                if (string.Equals(Session["UserType"]?.ToString(), "3", StringComparison.OrdinalIgnoreCase))
                {
                    var tenant = db.Tenants.Find(message.TenantID);
                    message.Sender = tenant.User.Email;
                }
                if (string.Equals(Session["UserType"]?.ToString(), "2", StringComparison.OrdinalIgnoreCase))
                {
                    var propertyManager = db.PropertyManagers.Find(message.ManagerID);
                    message.Sender = propertyManager.User.Email;
                    
                }
                db.Messages.Add(message);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ManagerID = new SelectList(db.PropertyManagers, "ManagerID", "ManagerID", message.ManagerID);
            ViewBag.TenantID = new SelectList(db.Tenants, "TenantID", "TenantID", message.TenantID);
            
            

            return View(message);
        }

        // GET: Messages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Message message = db.Messages.Find(id);
            if (message == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManagerID = new SelectList(db.PropertyManagers, "ManagerID", "ManagerID", message.ManagerID);
            ViewBag.TenantID = new SelectList(db.Tenants, "TenantID", "TenantID", message.TenantID);
            return View(message);
        }

        // POST: Messages/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MessageID,ManagerID,TenantID,MessageBody,DateSent,Sender")] Message message)
        {
            if (ModelState.IsValid)
            {
                db.Entry(message).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManagerID = new SelectList(db.PropertyManagers, "ManagerID", "ManagerID", message.ManagerID);
            ViewBag.TenantID = new SelectList(db.Tenants, "TenantID", "TenantID", message.TenantID);
            return View(message);
        }

        // GET: Messages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Message message = db.Messages.Find(id);
            if (message == null)
            {
                return HttpNotFound();
            }
            return View(message);
        }

        // POST: Messages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Message message = db.Messages.Find(id);
            db.Messages.Remove(message);
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
