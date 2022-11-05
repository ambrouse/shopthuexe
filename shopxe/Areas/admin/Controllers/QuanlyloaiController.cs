using shopxe.Areas.admin.hamxuli;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopxe.Models;
namespace shopxe.Areas.admin.Controllers
{
    public class QuanlyloaiController : Controller
    {
        // GET: admin/Quanlyloai
        [kiemtradangnhap()]
        public ActionResult Index()
        {
            qlshopxeEntities db = new qlshopxeEntities();
            return View(db.loais.ToList());
        }
    }
}