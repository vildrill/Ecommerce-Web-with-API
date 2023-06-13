using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Project.Models;
using Microsoft.EntityFrameworkCore;
using X.PagedList;
using Project.Areas.Admin.Attributes;
using System.IO;
using System.Collections.Generic;
using BC = BCrypt.Net.BCrypt;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;

namespace project.Controllers
{
    public class WishlistController : Controller
    {
        public MyDbContext db = new MyDbContext();
        public IActionResult Index()
        {
            string json_wishlist = "";
            List<ItemProduct> products = new List<ItemProduct>();
            if (!String.IsNullOrEmpty(HttpContext.Session.GetString("wishlist")))
            {
                json_wishlist = HttpContext.Session.GetString("wishlist");
                products = JsonConvert.DeserializeObject<List<ItemProduct>>(json_wishlist);
            }
            //return Content(products.Count.ToString());
            return View("Index",products);
        }

        public IActionResult Add(int? id)
        {
            int _id = id ?? 0;
            ItemProduct record = db.Products.Where(item => item.Id == _id).FirstOrDefault();
            //---
            string json_wishlist = "";
            List<ItemProduct> products = new List<ItemProduct>();
            if (!String.IsNullOrEmpty(HttpContext.Session.GetString("wishlist")))
            {
                json_wishlist = HttpContext.Session.GetString("wishlist");
                products = JsonConvert.DeserializeObject<List<ItemProduct>>(json_wishlist);
                var check = products.Where(item => item.Id == record.Id).Count();
                if (check == 0)
                    products.Add(record);
            } 
            else
            {
                products.Add(record);
            }    
            json_wishlist = JsonConvert.SerializeObject(products);
            HttpContext.Session.SetString("wishlist",json_wishlist);
            //---
            return Redirect("/Wishlist");
        }
        public IActionResult Remove(int? id)
        {
            int _id = id ?? 0;
            ItemProduct record = db.Products.Where(item => item.Id == _id).FirstOrDefault();
            //---
            string json_wishlist = "";
            List<ItemProduct> products = new List<ItemProduct>();
            if (!String.IsNullOrEmpty(HttpContext.Session.GetString("wishlist")))
            {
                json_wishlist = HttpContext.Session.GetString("wishlist");
                products = JsonConvert.DeserializeObject<List<ItemProduct>>(json_wishlist);
            }
            //---
            for (int i = 0; i < products.Count; i++)
            {
                if (products[i].Id == id)
                {
                    products.RemoveAt(i);
                }
            }            
            //---
            json_wishlist = JsonConvert.SerializeObject(products);
            HttpContext.Session.SetString("wishlist", json_wishlist);
            //---
            return Redirect("/Wishlist");
        }
    }
}
