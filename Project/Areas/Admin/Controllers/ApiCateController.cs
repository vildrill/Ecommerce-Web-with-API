using Azure;
using Microsoft.AspNetCore.Mvc;
using Project.Models;

namespace Project.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiCateController : Controller
    {     
            public static List<string> listId;
            public static IWebHostEnvironment _webHostEnvironment;

            public ApiCateController(IWebHostEnvironment webHostEnvironment)
            {
                _webHostEnvironment = webHostEnvironment;
            }

            [HttpGet]
            public List<ItemCategory> GetCate()
            {
                MyDbContext db = new MyDbContext();
                return db.Categories.Where(n => n.ParentId == 0).ToList();
            }


            [HttpGet("constraint/{id}")]
            public ItemCategory GetCateId(int  id)
            {
                MyDbContext db = new MyDbContext();
                return db.Categories.FirstOrDefault(n => n.Id == id);
            }

            [HttpGet("{id}")]
            public List<ItemCategory> GetCateParrentId(int id)
            {
                MyDbContext db = new MyDbContext();
                return db.Categories.Where(n => n.ParentId == id).ToList();
            }

        
            [HttpPost]
            public bool InsertCate(string name,int parrent,int hp)
            {
                try
                {
                    MyDbContext db = new MyDbContext();
                    ItemCategory cate = new ItemCategory();
                    cate.Name = name;
                    cate.ParentId = parrent;
                    cate.DisplayHomePage = hp;
                    db.Categories.Add(cate);
                    db.SaveChanges();

                  
                    return true;
                }
                catch
                {
                    return false;
                }
            }   

            [HttpPut("{id}")]
            public bool UpdateCate(int id, string name)
            {
                try
                {
                    MyDbContext db = new MyDbContext();
                    //Lấy mã khách đã có
                    ItemCategory prod = db.Categories.FirstOrDefault(x => x.Id == id);
                    if (prod == null) return false;
                    prod.Name = name;
                    
                    db.SaveChanges();
                                     
                //--
               /*
                List<int> numbers = new List<int>(Array.ConvertAll(parrent.Split(','), int.Parse));
                List<int> list_id_tags = numbers;
                    foreach (var tag_id in list_id_tags)
                    {
                        ItemCategoriesProducts record_tag_product = new ItemCategoriesProducts();
                        record_tag_product.CategoryId = Convert.ToInt32(tag_id);
                        
                        db.CategoriesProducts.Add(record_tag_product);
                        db.SaveChanges();
                    }*/
                    return true;
                }
                catch
                {
                    return false;
                }
            }

            [HttpDelete("{id}")]
            public bool DeleteProduct(int id)
            {
                try
                {
                    MyDbContext db = new MyDbContext();
                    ItemCategory prod = db.Categories.FirstOrDefault(x => x.Id == id);
                    if (prod == null) return false;
                    db.Categories.Remove(prod);
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
