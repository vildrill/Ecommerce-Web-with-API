using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;

namespace Project.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class APIAdvController : ControllerBase
    {
        public static List<string> listId;
        public static IWebHostEnvironment _webHostEnvironment;

        public APIAdvController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }
        [HttpGet]
        public List<ItemAdv> GetAdv()
        {
            MyDbContext db = new MyDbContext();
            return db.Adv.ToList();
        }
        [HttpGet("{id}")]
        public ItemAdv GetAdvId(int id)
        {
            MyDbContext db = new MyDbContext();
            return db.Adv.FirstOrDefault(n => n.Id == id);
        }
        /*[Route("Search/{name}")]
        [HttpGet]
        public List<ItemAdv> GetAdvName(string name)
        {
            MyDbContext db = new MyDbContext();
            return db.Adv.Where(n => n.Name.Contains(name)).ToList();
        }*/

        [HttpPost]
        public bool InsertAdv(string name, string photo, int position)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemAdv ad = new ItemAdv();
                ad.Name = name;
                ad.Photo = photo.Replace("C:\\fakepath\\", "");
                ad.Position = position;
                db.Adv.Add(ad);
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        [Route("Insert")]
        [HttpPost]
        public async Task<IActionResult> Post(IList<IFormFile> files)
        {
            var path = "";
            foreach (var formFile in files)
            {
                if (formFile.Length > 0)
                {
                    path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Upload/Adv/", formFile.FileName);
                    var filePath = Path.GetTempFileName();

                    using (var stream = System.IO.File.Create(path))
                    {
                        await formFile.CopyToAsync(stream);
                    }
                }
            }
            return Ok();
        }

        /*public string Post([FromForm] FileUpload fileUpload)
        {
            try
            {
                if(fileUpload.files.Length > 0)
                {
                    string path = _webHostEnvironment.WebRootPath + "/Upload/Adv/";
                    if(!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    using (FileStream fileStream = System.IO.File.Create(path + fileUpload.files.FileName))
                    {
                        fileUpload.files.CopyTo(fileStream);
                        fileStream.Flush();
                        return fileUpload.files.FileName;
                    }
                }
                else
                {
                    return "Not upload";
                }
            }
            catch (Exception ex) 
            {
                return ex.Message;
            }
        }*/


        [HttpPut("{id}")]
        public bool UpdateAdv(int id, string name, string photo, int position)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemAdv ad = db.Adv.FirstOrDefault(x => x.Id == id);
                if (ad == null) return false;
                ad.Name = name;
                ad.Photo = photo.Replace("C:\\fakepath\\", "");
                ad.Position = position;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }


        [HttpDelete("{id}")]
        public bool DeleteAdv(int id)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemAdv ad = db.Adv.FirstOrDefault(x => x.Id == id);
                if (ad == null) return false;
                db.Adv.Remove(ad);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}