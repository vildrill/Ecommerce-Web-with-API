using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;
using BC = BCrypt.Net.BCrypt;
namespace Project.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiCustomerController : ControllerBase
    {
        public static IWebHostEnvironment _webHostEnvironment;

        public ApiCustomerController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        
        [HttpGet]
        public List<ItemCustomers> GetAllCus()
        {
            MyDbContext db = new MyDbContext();
            return db.Customers.ToList();
        }

        [HttpGet("{id}")]
        public ItemCustomers GetCusId(int id)
        {
            MyDbContext db = new MyDbContext();
            return db.Customers.FirstOrDefault(n => n.Id == id);
        }
        [HttpPost]
        public bool InsertCus(string name, string email, string address, string phone, string password)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemCustomers cus = new ItemCustomers();

                cus.Name = name;
                cus.Email = email;
                cus.Address = address;
                cus.Phone = phone;
                password = BC.HashPassword(password);
                cus.Password = password;


                db.Customers.Add(cus);
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }
        

        [HttpPut("{id}")]
        public bool UpdateCus(int id, string name, string email, string address, string phone, string password)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemCustomers cus = db.Customers.FirstOrDefault(x => x.Id == id);
                if (cus == null) return false;
                cus.Name = name;
                cus.Email = email;
                cus.Address = address;
                cus.Phone = phone;
                if (!String.IsNullOrEmpty(password))
                {                  
                    password = BC.HashPassword(password);
                    cus.Password = password;
                }           
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }


        [HttpDelete("{id}")]
        public bool DeleteCus(int id)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                ItemCustomers prod = db.Customers.FirstOrDefault(x => x.Id == id);
                if (prod == null) return false;
                db.Customers.Remove(prod);
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
