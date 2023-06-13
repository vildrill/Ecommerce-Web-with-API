using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;

namespace Project.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiOrderController : ControllerBase
    {

        [HttpGet]
        public JsonResult GetOrders()
        {
            MyDbContext db = new MyDbContext();
            var list_order = (from order in db.Orders
                              join customer in db.Customers
                              on order.CustomerId equals customer.Id
                              select new { customer.Name, customer.Address, customer.Phone, order.Create, order.Price, order.Status, order.Id }).ToList();
            return new JsonResult(list_order);
        }

        [HttpGet("{id}")]
        public JsonResult GetOrderDetail(int id)
        {
            MyDbContext db = new MyDbContext();
            var order_detail = (from order in db.Orders
                                join detail in db.OrdersDetail
                                on order.Id equals detail.OrderId
                                join product in db.Products
                                on detail.ProductId equals product.Id
                                where order.Id == id
                                select new { product.Name, product.Photo, product.Price, product.Discount, detail.Quantity }).ToList();
            return new JsonResult(order_detail);
        }
        [HttpPut("{id}")]
        public bool CheckStatus(int id)
        {
            try
            {
                MyDbContext db = new MyDbContext();
                int _OrderId = id;
                ItemOrders record = db.Orders.Where(tbl => tbl.Id == _OrderId).FirstOrDefault();
                if (record != null)
                {
                    record.Status = 1;
                    db.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}

