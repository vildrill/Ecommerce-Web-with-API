using Microsoft.AspNetCore.Mvc;
using Project.Areas.Admin.Attributes;

namespace Project.Areas.Admin.Controllers
{
    [Area("Admin")]
    [CheckLogin]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Values()
        {
            return View();
        }
        public IActionResult ApiBlog()
        {
            return View();
        }
        public IActionResult ApiCustomer()
        {
            return View();
        }
        public IActionResult APITag()
        {
            return View();
        }
        public IActionResult ApiCate()
        {
            return View();
        }
        public IActionResult ApiAdv() 
        {
            return View();

        }
        public IActionResult ApiSlide()
        {
            return View();

        }
        public IActionResult ApiOrder()
        {
            return View();
        }


    }
}
