using Sovereign.Models.BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sovereign.Controllers
{
    public class SovereignController : Controller
    {
        // GET: Sovereign
        public ActionResult Index()
        {
            var db = SovereignBus.DanhSach();
            return View(db);
        }

        // GET: Sovereign/Details/5
        public ActionResult Details(String id)
        {
            var db = SovereignBus.ChiTiet(id);
            return View(db);
        }

        // GET: Sovereign/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Sovereign/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Sovereign/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Sovereign/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Sovereign/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Sovereign/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult PlaceOrder(int productId)
        {
            try
            {
                // TODO: Cập nhật cơ sở dữ liệu hoặc thực hiện các tác vụ liên quan đến đặt hàng thành công

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, error = ex.Message });
            }
        }



    }
}
