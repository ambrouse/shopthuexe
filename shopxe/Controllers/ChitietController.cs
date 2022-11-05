using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe.Models;
namespace shopxe.Controllers
{
    public class ChitietController : Controller
    {
        // GET: admin/Chitiet
        public ActionResult Index(int id)
        {
            qlshopxeEntities db = new qlshopxeEntities();
            var x = db.sanphams.Find(id);
            return View(x);
        }
    }
}