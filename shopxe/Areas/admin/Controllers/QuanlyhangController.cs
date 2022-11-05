using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe.Areas.admin.hamxuli;
using shopxe.Models;
namespace shopxe.Areas.admin.Controllers
{
    public class QuanlyhangController : Controller
    {
        // GET: admin/Quanlyhang
        [kiemtradangnhap()]
        public ActionResult Index()
        {
            qlshopxeEntities db = new qlshopxeEntities();
                return View(db.hangs.ToList());
        }
    }
}