using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Project.Models;
using Microsoft.EntityFrameworkCore;
using X.PagedList;
using Project.Areas.Admin.Attributes;
using System.IO;
using System.Collections.Generic;
using BC = BCrypt.Net.BCrypt;

namespace Project.Controllers
{
    public class AccountController : Controller
    {
        public MyDbContext db = new MyDbContext();
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public IActionResult RegisterPost(IFormCollection fc)
        {
            string _name = fc["name"];
            string _email = fc["email"];
            string _phone = fc["phone"];
            string _address = fc["address"];
            string _password = fc["password"];
            _password = BC.HashPassword(_password);
            int checkMail = db.Customers.Where(item => item.Email == _email).Count();
            if (checkMail == 0)
            {
                ItemCustomers record = new ItemCustomers();
                record.Name = _name;
                record.Email = _email;
                record.Phone = _phone;
                record.Address = _address;
                record.Password = _password;
                //---
                db.Customers.Add(record);
                db.SaveChanges();
            }
            else
            {
                return Redirect("/Account/Register?notify=exists");
            }
            return Redirect("/Account/Login?notify=register-success");
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult LoginPost(IFormCollection fc)
        {
            string _email = fc["email"];
            string _password = fc["password"];  
            ItemCustomers record = db.Customers.Where(item => item.Email == _email).FirstOrDefault();
            if (record != null && BC.Verify(_password, record.Password) == true)
            {
                HttpContext.Session.SetString("customer_email", record.Email.ToString());
                HttpContext.Session.SetString("customer_id", record.Id.ToString());
            }
            else
                return Redirect("/Account/Login?notify=login-invalid");
            return Redirect("/Home");
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("customer_email");
            HttpContext.Session.Remove("customer_id");
            return Redirect("/Account/Login");
        }
    }
}
