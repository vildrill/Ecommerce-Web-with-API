using Azure;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;
using System.Reflection.Metadata.Ecma335;
using System.Security.Cryptography;

namespace Project.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class ValuesController : ControllerBase
    {
        public static List<string> listId;
        public static IWebHostEnvironment _webHostEnvironment;

        public ValuesController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        [HttpGet]
        public List<ItemProduct> GetProducts()
        {
            MyDbContext db = new MyDbContext();
            return db.Products.ToList();
        }

        [HttpGet("{id}")]
        public ItemProduct GetProductId(int id)
        {
            MyDbContext db = new MyDbContext();
            return db.Products.FirstOrDefault(n => n.Id == id);
        }

        [Route("GetTag")]
        [HttpGet]
        public List<ItemTag> GetTag()
        {
            MyDbContext db = new MyDbContext();
            return db.Tags.ToList();
        }

        [Route("GetCategory")]
        [HttpGet]
        public List<ItemCategory> GetCategory()
        {
            MyDbContext db = new MyDbContext();
            return db.Categories.ToList();
        }

        [HttpPost]
        public bool InsertProduct(string name, string description, string content, string photo, int hot, float price, float discount, string tag, string category)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemProduct prod = new ItemProduct();
                prod.Name = name;
                prod.Description = description;
                prod.Content = content;


                prod.Photo = photo.Replace("C:\\fakepath\\", "");
                prod.Hot = hot;
                prod.Price = price;
                prod.Discount = discount;
                db.Products.Add(prod);
                db.SaveChanges();

                List<int> numbers = new List<int>(Array.ConvertAll(tag.Split(','), int.Parse));

                int insert_id = prod.Id;
                List<int> lst_id_tags = numbers;
                foreach (var tag_id in lst_id_tags)
                {
                    ItemTagProduct record_tag_product = new ItemTagProduct();
                    record_tag_product.TagId = Convert.ToInt32(tag_id);
                    record_tag_product.ProductId = insert_id;
                    db.TagsProducts.Add(record_tag_product);
                    db.SaveChanges();
                }

                List<int> categories_id = new List<int>(Array.ConvertAll(category.Split(','), int.Parse));
                List<int> lst_id_cate = categories_id;
                foreach (var item in lst_id_cate)
                {
                    ItemCategoriesProducts record_cate_product = new ItemCategoriesProducts();
                    record_cate_product.CategoryId = Convert.ToInt32(item);
                    record_cate_product.ProductId = prod.Id;
                    db.CategoriesProducts.Add(record_cate_product);
                    db.SaveChanges();
                }
                /*ItemTagProduct record_tag_product = new ItemTagProduct();
                record_tag_product.TagId = Convert.ToInt32(tag);
                record_tag_product.ProductId = prod.Id;
                db.TagsProducts.Add(record_tag_product);
                db.SaveChanges();*/

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
                    path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Upload/Products/", formFile.FileName);
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
                    string path = _webHostEnvironment.WebRootPath + "/Upload/Products/";
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
        public bool UpdateProduct(int id, string name, string description, string content, string photo, int hot, float price, float discount, string tag, string category)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemProduct prod = db.Products.FirstOrDefault(x => x.Id == id);
                if (prod == null) return false;
                prod.Name = name;
                prod.Description = description;
                prod.Content = content;
                prod.Photo = photo.Replace("C:\\fakepath\\", "");
                prod.Hot = hot;
                prod.Price = price;
                prod.Discount = discount;
                db.SaveChanges();

                List<ItemTagProduct> list_tag_product = db.TagsProducts.Where(item => item.ProductId == id).ToList();
                foreach (var item_tag_product in list_tag_product)
                {
                    db.TagsProducts.Remove(item_tag_product);
                }
                db.SaveChanges();
                //--

                List<int> numbers = new List<int>(Array.ConvertAll(tag.Split(','), int.Parse));
                List<int> list_id_tags = numbers;
                foreach (var tag_id in list_id_tags)
                {
                    ItemTagProduct record_tag_product = new ItemTagProduct();
                    record_tag_product.TagId = Convert.ToInt32(tag_id);
                    record_tag_product.ProductId = id;
                    db.TagsProducts.Add(record_tag_product);
                    db.SaveChanges();
                }


                List<ItemCategoriesProducts> list_cate_product = db.CategoriesProducts.Where(item => item.ProductId == id).ToList();
                foreach (var item in list_cate_product)
                {
                    db.CategoriesProducts.Remove(item);
                }
                db.SaveChanges();

                List<int> categories_id = new List<int>(Array.ConvertAll(category.Split(','), int.Parse));
                List<int> lst_id_cate = categories_id;
                foreach (var item in lst_id_cate)
                {
                    ItemCategoriesProducts record_cate_product = new ItemCategoriesProducts();
                    record_cate_product.CategoryId = Convert.ToInt32(item);
                    record_cate_product.ProductId = prod.Id;
                    db.CategoriesProducts.Add(record_cate_product);
                    db.SaveChanges();
                }

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
                ItemProduct prod = db.Products.FirstOrDefault(x => x.Id == id);
                if (prod == null) return false;
                db.Products.Remove(prod);
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