using Sovereign.Models.BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sovereign.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        // GET: LoaiSanPham
        public ActionResult Index(String id)
        {
            var ds = LoaiSanPhamBus.ChiTiet(id);
            return View(ds);
        }


    }
}