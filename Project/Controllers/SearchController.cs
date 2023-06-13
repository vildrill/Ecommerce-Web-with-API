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
    public class SearchController : Controller
    {
        public MyDbContext db = new MyDbContext();
        public IActionResult SearchPrice(int? page)
        {
            //---
            double fromPrice = !String.IsNullOrEmpty(Request.Query["fromPrice"]) ? Convert.ToDouble(Request.Query["fromPrice"]) : 0;
            double toPrice = !String.IsNullOrEmpty(Request.Query["toPrice"]) ? Convert.ToDouble(Request.Query["toPrice"]) : 0;
            //---
            ViewBag.fromPrice = fromPrice;
            ViewBag.toPrice = toPrice;
            int current_page = page ?? 1;
            int record_per_page = 6;
            List<ItemProduct> list_record = db.Products.Where(item => (item.Price - (item.Price * item.Discount) / 100) >= fromPrice && (item.Price - (item.Price * item.Discount) / 100) <= toPrice).OrderByDescending(item => item.Id).ToList();
            //---
            return View("SearchPrice", list_record.ToPagedList(current_page, record_per_page));

        }
        public IActionResult Tag(int? page, int? id)
        {
            //---
            int _id = id ?? 0;
            //---
            ViewBag._id = id;
            //---
            int current_page = page ?? 1;
            int record_per_page = 6;
            List<ItemProduct> list_record = (from tag in db.Tags join tag_product in db.TagsProducts on tag.Id equals tag_product.TagId join product in db.Products on tag_product.ProductId equals product.Id where tag.Id == _id select product).ToList();
            //---
            return View("SearchTag", list_record.ToPagedList(current_page, record_per_page));
        }
        public IActionResult SearchName(int? page)
        {
            //---
            string key = !String.IsNullOrEmpty(Request.Query["key"]) ? Request.Query["key"] : "";
            //---
            ViewBag.key = key;

            //return Content(CategoryId.ToString());
            //---
            int current_page = page ?? 1;
            int record_per_page = 6;
            List<ItemProduct> list_record = db.Products.Where(item => item.Name.Contains(key) || item.Description.Contains(key) || item.Content.Contains(key)).OrderByDescending(item => item.Id).ToList();
            //---
            return View("SearchName", list_record.ToPagedList(current_page, record_per_page));
        }
        public string Ajax()
        {
            string key = !String.IsNullOrEmpty(Request.Query["key"]) ? Request.Query["key"] : "";
            List<ItemProduct> list_record = db.Products.Where(item => item.Name.Contains(key) || item.Description.Contains(key) || item.Content.Contains(key)).OrderByDescending(item => item.Id).ToList();
            //---
            string str = "";
            foreach (var item in list_record)
                str = str + "<li><a href='/Products/Detail/" + item.Id + "'><img src='/Upload/Products/" + item.Photo + "'>" + item.Name + "</a></li>";
            return str;
        }
    }
}
