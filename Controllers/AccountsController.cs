using FinalProject_PropertyManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace FinalProject_PropertyManagement.Controllers
{
    public class AccountsController : Controller
    {
        // GET: Accounts
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserModel user)
        {
            using (PropertyRentalManagementEntities context = new PropertyRentalManagementEntities())
            {
                // Fetch the user from the database based on username and password
                var result = context.Users.FirstOrDefault(x => x.Username == user.Username && x.Password == user.Password);

                if (result != null)
                {
                    // Check if UserType is not null
                    if (result.UserType.HasValue)
                    {
                        // Store UserType in session
                        Session["UserType"] = result.UserType.Value.ToString();
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        // UserType is null, handle the case accordingly
                        ModelState.AddModelError(String.Empty, "UserType is null.");
                        return View();
                    }
                }
                else
                {
                    // User not found, redirect to Signup
                    return RedirectToAction("Signup", "Accounts");
                }
            }
        }

        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(User user)
        {
            using (PropertyRentalManagementEntities context = new PropertyRentalManagementEntities())
            {
                context.Users.Add(user);
                context.SaveChanges();
            }
            return RedirectToAction("Login");
        }

        public ActionResult Logout()
        {
            Session["UserType"] = null;
            //FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}