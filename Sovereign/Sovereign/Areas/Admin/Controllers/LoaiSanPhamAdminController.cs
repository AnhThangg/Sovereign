using Sovereign.Models.BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SovereignConnection;

namespace Sovereign.Areas.Admin.Controllers
{
    public class LoaiSanPhamAdminController : Controller
    {
        // GET: Admin/LoaiSanPhamAdmin
        public ActionResult Index()
        {
            var ds = LoaiSanPhamBus.DanhSach();
            return View(ds);
        }

        // GET: Admin/LoaiSanPhamAdmin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/LoaiSanPhamAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LoaiSanPhamAdmin/Create
        [HttpPost]
        public ActionResult Create(Category lsp)
        {
            try
            {
                // TODO: Add insert logic here
                LoaiSanPhamBus.ThemLSP(lsp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/LoaiSanPhamAdmin/Edit/5
        public ActionResult Edit(string id)
        {
            return View(LoaiSanPhamBus.ChiTietAdmin(id));
        }

        // POST: Admin/LoaiSanPhamAdmin/Edit/5
        [HttpPost]
        public ActionResult Edit(string id, Category lsp)
        {
            try
            {
                // TODO: Add update logic here
                LoaiSanPhamBus.UpdateLSP(id, lsp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }


        // GET: Admin/LoaiSanPhamAdmin/Delete/5
        public ActionResult Delete(String id)
        {
            return View(LoaiSanPhamBus.ChiTietAdmin(id));
        }

        // POST: Admin/LoaiSanPhamAdmin/Delete/5
        [HttpPost]
        public ActionResult Delete(string id, LoaiSanPhamBus lsp)
        {
            try
            {
                LoaiSanPhamBus.XoaLSP(id); // Gọi phương thức xóa từ LoaiSanPhamBus

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
