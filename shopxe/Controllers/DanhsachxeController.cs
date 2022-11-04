using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe.Models;
namespace shopxe.Controllers
{
    public class DanhsachxeController : Controller
    {
        // GET: Danhsachxe
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Danhsachxemoinhat() {
            qlshopxeEntities db = new qlshopxeEntities();
            var list = (from x in db.sanphams orderby x.id descending select x).ToList();
            return View(list);
        }
        public ActionResult timkiem(String ten) {
            qlshopxeEntities db = new qlshopxeEntities();
            var list = db.sanphams.Where(x => x.ten.ToLower().Contains(ten.ToLower()));
            return View(list);
        }

    }
}