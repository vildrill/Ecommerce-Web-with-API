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

namespace Project.Areas.Admin.Controllers
{
    [Area("Admin")]
    
    [CheckLogin]
    public class AdvController : Controller
    {
        public MyDbContext db = new MyDbContext();


        public IActionResult Index(int? page)
        {
            
            int current_page = page ?? 1;           
            int record_per_page = 4;           
            List<ItemAdv> list_record = db.Adv.OrderByDescending(item => item.Id).ToList();           
            return View("Index", list_record.ToPagedList(current_page, record_per_page));

        }

        public IActionResult Update(int? id)
        {
            int _id = id ?? 0;          
            ItemAdv record = db.Adv.Where(item => item.Id == _id).FirstOrDefault();          
            ViewBag.action = "/Admin/Adv/UpdatePost/" + _id;      
            return View("CreateUpdate", record);
        }        

        [HttpPost]
        public IActionResult UpdatePost(int? id, IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            int _Position = Convert.ToInt32(fc["Position"].ToString().Trim());
            //---
            int _id = id ?? 0;            
            var record = db.Adv.Where(item => item.Id == _id).FirstOrDefault();

            record.Name = _Name;
            record.Position = _Position;
            //---
            string _FileName = "";
            try
            {
                _FileName = Request.Form.Files[0].FileName;
            }
            catch {; }
            if (!String.IsNullOrEmpty(_FileName))
            {
                if (record.Photo != null && System.IO.File.Exists(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", "Adv", record.Photo)))
                {
                    System.IO.File.Delete(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", "Adv", record.Photo));
                }
                var timestap = DateTime.Now.ToFileTime();
                _FileName = timestap + "_" + _FileName;
                string _Path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Upload/Adv", _FileName);
                using (var stream = new FileStream(_Path, FileMode.Create))
                {
                    Request.Form.Files[0].CopyTo(stream);
                }
                record.Photo = _FileName;
            }
            //---
            db.SaveChanges();
            //---
            return Redirect("/Admin/Adv");
        }

        public IActionResult Create()
        {
            ViewBag.action = "/Admin/Adv/CreatePost";
            return View("CreateUpdate");
        }
        [HttpPost]
        public IActionResult CreatePost(IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            int _Position = Convert.ToInt32(fc["Position"].ToString().Trim());
            //---
            ItemAdv record = new ItemAdv();
            record.Name = _Name;
            record.Position = _Position;
            //---
            string _FileName = "";
            try
            {
                _FileName = Request.Form.Files[0].FileName;
            }
            catch {; }
            if (!String.IsNullOrEmpty(_FileName))
            {
                var timestap = DateTime.Now.ToFileTime();
                _FileName = timestap + "_" + _FileName;
                string _Path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Upload/Adv", _FileName);
                using (var stream = new FileStream(_Path, FileMode.Create))
                {
                    Request.Form.Files[0].CopyTo(stream);
                }
            }
            record.Photo = _FileName;

            //---
            db.Adv.Add(record);
            db.SaveChanges();
            //---
            return Redirect("/Admin/Adv");
        }
        public IActionResult Delete(int? id)
        {
            int _id = id ?? 0;
            var record = db.Adv.Where(item => item.Id == _id).FirstOrDefault();
            if (record.Photo != null && System.IO.File.Exists(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", "Adv", record.Photo)))
            {
                System.IO.File.Delete(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", "Adv", record.Photo));
            }
            db.Adv.Remove(record);
            db.SaveChanges();
            return Redirect("/Admin/Adv");
        }

    }
}
