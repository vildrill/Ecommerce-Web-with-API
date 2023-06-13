using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;

namespace Project.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class APITagController : ControllerBase
    {
        public static List<string> listId;
        public static IWebHostEnvironment _webHostEnvironment;

        public APITagController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }
        [HttpGet]
        public List<ItemTag> GetTags()
        {
            MyDbContext db = new MyDbContext();
            return db.Tags.ToList();
        }
        [HttpGet("{id}")]
        public ItemTag GetTagId(int id)
        {
            MyDbContext db = new MyDbContext();
            return db.Tags.FirstOrDefault(n => n.Id == id);
        }
        [Route("Search/{name}")]
        [HttpGet]
        public List<ItemTag> GetTagName(string name)
        {
            MyDbContext db = new MyDbContext();
            return db.Tags.Where(n => n.Name.Contains(name)).ToList();
        }
        [HttpPost]
        public bool InsertTag(string name)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemTag tg = new ItemTag();
                tg.Name = name;

                db.Tags.Add(tg);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        [HttpPut("{id}")]
        public bool UpdateTag(int id, string name)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemTag tg = db.Tags.FirstOrDefault(x => x.Id == id);
                if (tg == null) return false;
                tg.Name = name;

                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpDelete("{id}")]
        public bool DeleteTag(int id)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemTag tg = db.Tags.FirstOrDefault(x => x.Id == id);
                if (tg == null) return false;
                db.Tags.Remove(tg);
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