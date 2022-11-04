
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Text;
using System.Web;
using System.Web.Mvc;
using shopxe.Models;
using shopxe.Areas.admin.Controllers;
namespace shopxe.Areas.admin.Controllers
{
    public class QuanlyxeController : Controller
    {
        // GET: admin/Quanlydulieu
        public ActionResult Index()
        {
            qlshopxeEntities db = new qlshopxeEntities();
            return View(db.sanphams.ToList());
        }
        public ActionResult Them() {
            return View(new sanpham());
        }
        [HttpPost]
        public ActionResult Them(sanpham model, HttpPostedFileBase file_1, HttpPostedFileBase file_2, HttpPostedFileBase file_3) {
            qlshopxeEntities db = new qlshopxeEntities();
            
            if (file_1 == null || file_2 == null || file_3 == null)
            {
                ViewBag.err = "chua nhap anh";
                return View(model);
            }
            if (String.IsNullOrEmpty(model.ten)) {
                ViewBag.err = "chua nhap ten xe";
                return View(model);
            }
            if (model.gia <= 0) {
                ViewBag.err = "gia phai lon hon 0";
                return View(model);
            }
            String x = Server.MapPath("/imgxe/");
            String y_1 = x + chuyendoi.convertToUnSign3(file_1.FileName.ToLower());
            String y_2 = x + chuyendoi.convertToUnSign3(file_2.FileName.ToLower());
            String y_3 = x + chuyendoi.convertToUnSign3(file_3.FileName.ToLower());
            file_1.SaveAs(y_1);
            file_2.SaveAs(y_2);
            file_3.SaveAs(y_3);
            model.imgurl_1 = "/imgxe/" + chuyendoi.convertToUnSign3(file_1.FileName.ToLower());
            model.imgurl_2 = "/imgxe/" + chuyendoi.convertToUnSign3(file_2.FileName.ToLower());
            model.imgurl_3 = "/imgxe/" + chuyendoi.convertToUnSign3(file_3.FileName.ToLower());
            db.sanphams.Add(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Update(int id) {
  
            qlshopxeEntities db = new qlshopxeEntities();
            var update = db.sanphams.Find(id);
            return View(update);
        }
        [HttpPost]
        public ActionResult Update(sanpham model, HttpPostedFileBase file_1, HttpPostedFileBase file_2, HttpPostedFileBase file_3)
        {
            qlshopxeEntities db = new qlshopxeEntities();
            var update = db.sanphams.Find(model.id);
            System.IO.File.Delete(Server.MapPath(update.imgurl_1)); System.IO.File.Delete(Server.MapPath(update.imgurl_2)); System.IO.File.Delete(Server.MapPath(update.imgurl_3));
            if (String.IsNullOrEmpty(model.ten)) {
                ViewBag.err = "khong duoc de trong ten";
                return View(model);    
            }
            if (file_1 == null || file_2 == null || file_3 == null || file_3 == null)
            {
                ViewBag.err = "ban phai nhap lai cac anh khi update";
                return View(model);
            }
                String x = Server.MapPath("/imgxe/");
                String y_1 = x + chuyendoi.convertToUnSign3(file_1.FileName.ToLower());
                String y_2 = x + chuyendoi.convertToUnSign3(file_2.FileName.ToLower());
                String y_3 = x + chuyendoi.convertToUnSign3(file_3.FileName.ToLower());
                file_1.SaveAs(y_1);
                file_2.SaveAs(y_2);
                file_3.SaveAs(y_3);
                update.imgurl_1 = "/imgxe/" + chuyendoi.convertToUnSign3(file_1.FileName.ToLower());
                update.imgurl_2 = "/imgxe/" + chuyendoi.convertToUnSign3(file_2.FileName.ToLower());
                update.imgurl_3 = "/imgxe/" + chuyendoi.convertToUnSign3(file_3.FileName.ToLower());
            update.ten = model.ten;
            update.loai = model.loai;
            update.hang = model.hang;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id) {
            qlshopxeEntities db = new qlshopxeEntities();
            var delete = db.sanphams.Find(id);
            System.IO.File.Delete(Server.MapPath(delete.imgurl_1)); System.IO.File.Delete(Server.MapPath(delete.imgurl_2)); System.IO.File.Delete(Server.MapPath(delete.imgurl_3));
            db.sanphams.Remove(delete);
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}