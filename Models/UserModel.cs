using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject_PropertyManagement.Models
{
    public class UserModel
    {
        private int id;
        private string username;
        private string password;
        private int usertype;


        public int Id { get => id; set => id = value; }
        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
        public int Usertype { get => usertype; set => usertype = value; }
    }
}