using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;

namespace Project.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiBlogController : ControllerBase
    {

        public static IWebHostEnvironment _webHostEnvironment;

        public ApiBlogController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        [HttpGet]
        public List<ItemBlog> GetAllBlog()
        {
            MyDbContext db = new MyDbContext();
            return db.Blogs.ToList();
        }
        [HttpGet("{id}")]
        public ItemBlog GetBlogId(int id)
        {
            MyDbContext db = new MyDbContext();
            return db.Blogs.FirstOrDefault(n => n.Id == id);
        }
        [HttpPost]
        public bool InsertBlog(string title, DateTime create_at, DateTime update_at, string description, string content, string photo, string video)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemBlog blog = new ItemBlog();
                blog.Title = title;
                blog.Description = description;
                blog.Content = content;
                blog.Photo = photo.Replace("C:\\fakepath\\", "");
                blog.Create_at = create_at;
                blog.Update_at = update_at;
                blog.Video = video;
                db.Blogs.Add(blog);
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
                    path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Upload/Blog/", formFile.FileName);
                    var filePath = Path.GetTempFileName();

                    using (var stream = System.IO.File.Create(path))
                    {
                        await formFile.CopyToAsync(stream);
                    }
                }
            }
            return Ok();
        }
        [HttpPut("{id}")]
        public bool UpdateBlog(int id, string title, DateTime create_at, DateTime update_at, string description, string content, string photo, string video)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemBlog blog = db.Blogs.FirstOrDefault(x => x.Id == id);
                if (blog == null) return false;
                blog.Title = title;
                blog.Description = description;
                blog.Content = content;
                blog.Photo = photo.Replace("C:\\fakepath\\", "");
                blog.Create_at = create_at;
                blog.Update_at = update_at;
                blog.Video = video;

                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }


        [HttpDelete("{id}")]
        public bool DeleteBlog(int id)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemBlog prod = db.Blogs.FirstOrDefault(x => x.Id == id);
                if (prod == null) return false;
                db.Blogs.Remove(prod);
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
