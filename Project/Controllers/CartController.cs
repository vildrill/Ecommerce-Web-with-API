﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Project.Models;
using Microsoft.EntityFrameworkCore;
using X.PagedList;
using Project.Areas.Admin.Attributes;
using System.IO;
using System.Collections.Generic;
using BC = BCrypt.Net.BCrypt;
using System.Security.Cryptography;
using MailKit.Net.Smtp;
using MimeKit;
using MailKit;
using MailKit.Security;


namespace Project.Controllers
{
    public class CartController : Controller
    {
        
        public MyDbContext db = new MyDbContext();
        public IActionResult Index()
        {
            List<Item> _cart = Cart.GetCart(HttpContext.Session);
            if (_cart != null)
            {
                ViewBag._cart = _cart;
                ViewBag._total = _cart.Sum(tbl => (tbl.ProductRecord.Price - (tbl.ProductRecord.Price * tbl.ProductRecord.Discount / 100)) * tbl.Quantity);
            }
            if (!String.IsNullOrEmpty(HttpContext.Session.GetString("customer_email")))
            {  
                List<ItemCustomers> cus = db.Customers.OrderByDescending(item => item.Id).ToList();
                foreach (var item in cus)
                {
                    if (item.Email == HttpContext.Session.GetString("customer_email"))
                    {
                        ViewBag.id = item.Id;
                        ViewBag.email = item.Email;
                        ViewBag.name = item.Name;
                        ViewBag.phone = item.Phone;
                    }
                }
                return View("Index", cus);
            }           
            return View();
        }
        public IActionResult Add(int id)
        {
            Cart.CartAdd(HttpContext.Session, id);
            return Redirect("/Cart");
        }

        public IActionResult Remove(int id)
        {
            Cart.CartRemove(HttpContext.Session, id);
            return Redirect("/Cart");
        }

        public IActionResult Destroy()
        {
            Cart.CartDestroy(HttpContext.Session);
            return Redirect("/Cart");
        }

        public IActionResult Update()
        {
            List<Item> _cart = Cart.GetCart(HttpContext.Session);
            foreach (var item in _cart)
            {
                int quantity = Convert.ToInt32(Request.Form["product_" + item.ProductRecord.Id]);
                Cart.CartUpdate(HttpContext.Session, item.ProductRecord.Id, quantity);
            }            
            return Redirect("/Cart");
        }

        public IActionResult Checkout()
        {
            if (HttpContext.Session.GetString("customer_email") == null)
                return Redirect("/Account/Login");
            else
            {
                if (!String.IsNullOrEmpty(HttpContext.Session.GetString("customer_email")))
                {
                    List<ItemCustomers> cus = db.Customers.OrderByDescending(item => item.Id).ToList();
                    foreach (var item in cus)
                    {
                        if (item.Email == HttpContext.Session.GetString("customer_email"))
                        {
                            ViewBag.id = item.Id;
                            ViewBag.email = item.Email;
                            ViewBag.name = item.Name;
                            ViewBag.phone = item.Phone;
                        }
                    }
                    
                }
                List<Item> _cart = Cart.GetCart(HttpContext.Session);
                int customer_id = int.Parse(HttpContext.Session.GetString("customer_id"));
                ItemOrders _RecordOrder = new ItemOrders();
                _RecordOrder.CustomerId = customer_id;
                _RecordOrder.Create = DateTime.Now;
                _RecordOrder.Price = _cart.Sum(tbl => tbl.ProductRecord.Price * tbl.Quantity);
                db.Orders.Add(_RecordOrder);
                db.SaveChanges();
                int order_id = _RecordOrder.Id;
                foreach (var item in _cart)
                {
                    ItemOrdersDetail _RecordOrdersDetail = new ItemOrdersDetail();
                    _RecordOrdersDetail.OrderId = order_id;
                    _RecordOrdersDetail.ProductId = item.ProductRecord.Id;
                    _RecordOrder.Price = _cart.Sum(tbl => tbl.Quantity * (tbl.ProductRecord.Price - (tbl.ProductRecord.Price * tbl.ProductRecord.Discount) / 100));
                    _RecordOrdersDetail.Quantity = item.Quantity;
                    //---
                    db.OrdersDetail.Add(_RecordOrdersDetail);
                    db.SaveChanges();
                }
                Cart.CartDestroy(HttpContext.Session);



                int _id = ViewBag.id;

                List<ItemOrders> list_order = db.Orders.Where(item => item.CustomerId == _id).OrderByDescending(item => item.Id).Take(1).ToList();
                foreach (var item in list_order)
                {
                    ViewBag.orderId = item.Id;
                }
                var message = new MimeMessage();               
                message.From.Add(new MailboxAddress("Noreply my site", "anjapan12345@gmail.com"));
                message.To.Add(MailboxAddress.Parse(ViewBag.email));
                message.Subject = "Contact email";
                message.Body = new TextPart(MimeKit.Text.TextFormat.Html) 
                { Text = "Xin chào "+ViewBag.name +". Đơn hàng "+ViewBag.orderId+" của bạn đã được giao thành công ngày " + DateTime.Now.ToString("yyyy-MM-dd/HH:mm:ss") + ". Vui lòng đăng nhập để xác nhận bạn đã nhận hàng và hài lòng với sản phẩm trong vòng 7 ngày. Sau khi bạn xác nhận, chúng tôi sẽ thanh toán cho Người bán gaming.gear. Nếu bạn không xác nhận trong khoảng thời gian này, Shopee cũng sẽ thanh toán cho Người bán." };
                using var client = new SmtpClient();

                client.Connect("smtp.gmail.com");
                client.Authenticate("anjapan12345@gmail.com", "uxmaiejumuozjsqb");
                client.Send(message);
                client.Disconnect(true);
                client.Dispose();
                /* return Redirect("/Cart?checkout=success");*/
                return View("Success");
            }
        }

        public IActionResult Success()
        {

            if (HttpContext.Session.GetString("customer_email") == null)
                return Redirect("/Account/Login");
            else
            {
                if (!String.IsNullOrEmpty(HttpContext.Session.GetString("customer_email")))
                {
                    List<ItemCustomers> cus = db.Customers.OrderByDescending(item => item.Id).ToList();
                    foreach (var item in cus)
                    {
                        if (item.Email == HttpContext.Session.GetString("customer_email"))
                        {
                            ViewBag.id = item.Id;
                            ViewBag.email = item.Email;
                            ViewBag.name = item.Name;
                            ViewBag.phone = item.Phone;
                        }
                    }
                    return View("Success", cus);
                }               
                
            }
            return View("Success");
            /*if (!String.IsNullOrEmpty(HttpContext.Session.GetString("customer_email")))
            {
                List<ItemCustomers> cus = db.Customers.OrderByDescending(item => item.Id).ToList();
                foreach (var item in cus)
                {
                    if (item.Email == HttpContext.Session.GetString("customer_email"))
                    {
                        ViewBag.id = item.Id;
                        ViewBag.email = item.Email;
                        ViewBag.name = item.Name;
                        ViewBag.phone = item.Phone;
                    }
                }  
                return View("Success", cus);               
            }
            return View("Success");*/
            /*var message = new MimeMessage();
            *//* message.From.Add(MailboxAddress.Parse(ViewBag.email));*//*
            message.From.Add(new MailboxAddress("Noreply my site", "anjapan12345@gmail.com"));
            message.To.Add(MailboxAddress.Parse("anjapan12345@gmail.com"));
            message.Subject = "Contact email";
            message.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = "<h4>Hi, my name is: Hien12312312"  };
            using var client = new SmtpClient();

            client.Connect("smtp.gmail.com");
            client.Authenticate("anjapan12345@gmail.com", "uxmaiejumuozjsqb");
            client.Send(message);
            client.Disconnect(true);
            client.Dispose();*/
        }
        public IActionResult Detail(int? id)
        {
            int _OrderId = id ?? 0;
            ViewBag.OrderId = _OrderId;
            List<ItemOrdersDetail> _ListRecord = db.OrdersDetail.Where(tbl => tbl.OrderId == _OrderId).ToList();
            return View("Detail", _ListRecord);
        }

    }
}
