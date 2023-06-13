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
    public class BlogController : Controller
    {
        public MyDbContext db = new MyDbContext();
        public IActionResult Index(int? page)
        {            
            int current_page = page ?? 1;
            int record_per_page = 9;
            List<ItemBlog> list_record = db.Blogs.OrderByDescending(item => item.Id).ToList();
            return View("Index", list_record.ToPagedList(current_page, record_per_page));
        }
        public IActionResult Detail(int? id)
        {
            int _id = id ?? 0;
            ItemBlog record = db.Blogs.Where(item => item.Id == _id).FirstOrDefault();
           
            return View("Detail", record);
        }
    }
}
