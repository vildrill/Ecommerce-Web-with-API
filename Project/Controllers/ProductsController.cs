using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using BC = BCrypt.Net.BCrypt;
using Project.Models;
using X.PagedList;
using System.Collections.Generic;
using Project.Areas.Admin.Attributes;
using System.Security.Cryptography;
using System.Data;
using Microsoft.Data.SqlClient;

namespace Project.Controllers
{
    public class ProductsController : Controller
    {
        public MyDbContext db = new MyDbContext();
        public IActionResult Index(int? page, int? id)
        {
            //---
            int CategoryId = id ?? 0;
            ViewBag.CategoryId = CategoryId;
            //---
            int current_page = page ?? 1;
            int record_per_page = 6;
            List<ItemProduct> list_record = db.Products.OrderByDescending(item => item.Id).ToList();
            if (CategoryId > 0)
            {
                //---
                var list_products = db.CategoriesProducts.Where(item => item.CategoryId == CategoryId).Select(item => new { item.ProductId });
                List<int> id_products = new List<int>();
                foreach (var item in list_products)
                {
                    id_products.Add(item.ProductId);
                }
                list_record = list_record.Where(item => id_products.Contains(item.Id)).ToList();
                //---
            }

            //
            string strOrder = "";
            if (!String.IsNullOrEmpty(Request.Query["order"]))
                strOrder = Request.Query["order"];
            ViewBag.Order = strOrder;
            switch (strOrder)
            {
                case "name-asc":
                    list_record = list_record.OrderBy(item => item.Name).ToList();
                    break;
                case "name-desc":
                    list_record = list_record.OrderByDescending(item => item.Name).ToList();
                    break;
                case "price-asc":
                    list_record = list_record.OrderBy(item => item.Price).ToList();
                    break;
                case "price-desc":
                    list_record = list_record.OrderByDescending(item => item.Price).ToList();
                    break;
            }
            return View("Index", list_record.ToPagedList(current_page, record_per_page));
        }
        public IActionResult Detail(int? id)
        {
            int _id = id ?? 0;
            ItemProduct record = db.Products.Where(item => item.Id == _id).FirstOrDefault();
            return View("Detail", record);
        }
        public IActionResult Rating(int? id)
        {
            if (!String.IsNullOrEmpty(HttpContext.Session.GetString("customer_email")))
            {
                int _ProductId = id ?? 0;
                int _Star = !String.IsNullOrEmpty(Request.Query["star"]) ? Convert.ToInt32(Request.Query["star"]) : 0;
                ItemRating record = new ItemRating();
                record.ProductId = _ProductId;
                record.Star = _Star;
                //---
                db.Rating.Add(record);
                db.SaveChanges();
                //---
                return Redirect("/Products/Detail/" + _ProductId);
            }
            else
                return Redirect("/Account/Login");
        }

    }
}
