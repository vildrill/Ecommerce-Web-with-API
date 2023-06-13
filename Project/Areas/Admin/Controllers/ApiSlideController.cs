using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;

namespace Project.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class APISlideController : ControllerBase
    {
        public static IWebHostEnvironment _webHostEnvironment;

        public APISlideController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        [HttpGet]
        public List<ItemSlide> GetSlides()
        {
            MyDbContext db = new MyDbContext();
            return db.Slides.ToList();
        }
        [HttpGet("{id}")]
        public ItemSlide GetSlideId(int id)
        {
            MyDbContext db = new MyDbContext();
            return db.Slides.FirstOrDefault(n => n.Id == id);
        }


        /*[Route("Search/{name}")]
        [HttpGet]
        public List<ItemSlide> GetSlideName(string name)
        {
            MyDbContext db = new MyDbContext();
            return db.Slides.Where(n => n.Name.Contains(name)).ToList();
        }*/

        [HttpPost]
        public bool InsertSlide(string name, string title, string subtitle, string photo, string link, string info)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemSlide sld = new ItemSlide();
                sld.Name = name;
                sld.Title = title;
                sld.SubTitle = subtitle;

                sld.Photo = photo.Replace("C:\\fakepath\\", "");
                sld.Link = link;
                sld.Info = info;

                db.Slides.Add(sld);
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
                    path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Upload/Slides/", formFile.FileName);
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
                    string path = _webHostEnvironment.WebRootPath + "/Upload/Slides/";
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
        public bool UpdateSlide(int id, string name, string title, string subtitle, string photo, string link, string info)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemSlide sld = db.Slides.FirstOrDefault(x => x.Id == id);
                if (sld == null) return false;
                sld.Name = name;
                sld.Title = title;
                sld.SubTitle = subtitle;
                sld.Photo = photo.Replace("C:\\fakepath\\", "");
                sld.Link = link;
                sld.Info = info;


                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }


        [HttpDelete("{id}")]
        public bool DeleteSlide(int id)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemSlide sld = db.Slides.FirstOrDefault(x => x.Id == id);
                if (sld == null) return false;
                db.Slides.Remove(sld);
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
