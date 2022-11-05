using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe.Models;
namespace shopxe.Controllers
{
    public class TrangchuController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            qlshopxeEntities db = new qlshopxeEntities();
            return View(db.sanphams.ToList());
        }
    }
}