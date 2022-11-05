using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using shopxe.Models;
namespace shopxe.Areas.admin.hamxuli
{
    public class kiemtramatkhau
    {
        qlshopxeEntities db = new qlshopxeEntities();
        public Boolean kiemtra(String name,String pass) {
            var z = db.admins.Find(1);
            var z_2 = db.admins.Find(2);
            
                return true;
           
        }
    }
}