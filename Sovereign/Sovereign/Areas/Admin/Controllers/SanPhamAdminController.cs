using Sovereign.Models.BUS;
using SovereignConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sovereign.Areas.Admin.Controllers
{
    public class SanPhamAdminController : Controller
    {
        // GET: Admin/SanPhamAdmin
        public ActionResult Index()
        {
            
            return View(SovereignBus.DanhSachSP());
        }

        // GET: Admin/SanPhamAdmin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/SanPhamAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/SanPhamAdmin/Create
        [HttpPost]
        public ActionResult Create(Product sp)
        {
            try
            {
                // TODO: Add insert logic here
                SovereignBus.InsertSP(sp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/SanPhamAdmin/Edit/5
        public ActionResult Edit(String id)
        {

            return View(SovereignBus.ChiTietAdmin(id));
        }

        // POST: Admin/SanPhamAdmin/Edit/5
        [HttpPost]
        public ActionResult Edit(String id, Product sp)
        {
            try
            {
                // TODO: Add update logic here
                SovereignBus.UpdateSP(id, sp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/SanPhamAdmin/Delete/5
        public ActionResult Delete(String id)
        {
            return View(SovereignBus.ChiTietAdmin(id));
        }

        // POST: Admin/SanPhamAdmin/Delete/5
        [HttpPost]
        public ActionResult Delete(String id, SovereignBus sp)
        {
            try
            {
                SovereignBus.XoaSP(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
