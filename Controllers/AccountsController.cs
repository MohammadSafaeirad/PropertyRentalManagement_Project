using FinalProject_PropertyManagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
                // Fetch the user from the database based on username
                var result = context.Users.FirstOrDefault(x => x.Username == user.Username);

                if (result != null)
                {
                    if (result != null)
                    {
                        // Hash the entered password for comparison
                        string hashedPassword = HashPassword(user.Password, result.Username);

                        // Compare the hashed password with the stored hashed password
                        if (result.Password == hashedPassword)
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
                    }
                    
                }

                // User not found or password doesn't match, redirect to Login with an error
                ModelState.AddModelError("", "Invalid username or password!");
                return View();
            }
        }


        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(User user, string confirmPassword)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    using (PropertyRentalManagementEntities context = new PropertyRentalManagementEntities())
                    {
                        user.UserType = 3;

                        if (user.Password != confirmPassword)
                        {
                            ModelState.AddModelError("ConfirmPassword", "Passwords do not match");
                            return View(user);
                        }

                        // Hash the password before saving to the database using the username as a salt
                        user.Password = HashPassword(user.Password, user.Username);

                        context.Users.Add(user);
                        context.SaveChanges();
                    }
                }
                catch (DbEntityValidationException ex)
                {
                    foreach (var validationErrors in ex.EntityValidationErrors)
                    {
                        foreach (var validationError in validationErrors.ValidationErrors)
                        {
                            Console.WriteLine($"Property: {validationError.PropertyName} Error: {validationError.ErrorMessage}");
                        }
                    }

                    // Handle or log the exception as needed                
                    throw;
                }
            }
            else
            {
                return View("Signup");
            }
            

            
            return RedirectToAction("Login");
        }

        public ActionResult Logout()
        {
            Session["UserType"] = null;
            //FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }

        // Helper method to hash a password with a pepper
        private string HashPassword(string password, string username)
        {
            // Replace "YourPepper" with a secret key specific to your application
            string pepper = "ThisIsRandomPapper";
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password + username + pepper));
                return Convert.ToBase64String(hashedBytes);
            }
        }
    }
}