using Sovereign.Models.BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sovereign.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TrangDangNhap(FormCollection f)
        {


            // Kiểm tra tên đăng nhập và mật khẩu
            string ssTaiKhoan = f["txtEmail"].ToString();
            string ssMatKhau = f["txtPassword"].ToString();




            if (ssTaiKhoan == "" & ssMatKhau == "")
            {
                ModelState.AddModelError("", "Vui loàng nhập tên đăng nhập và mật khẩu của bạn !");
            }
            else if (ssTaiKhoan == "")
            {
                ModelState.AddModelError("", "Bạn không được bỏ trống tên đăng nhập !");
            }
            else if (ssMatKhau == "")
            {
                ModelState.AddModelError("", "Bạn không được bỏ trống mật khẩu !");
            }
            else
            {

                var db = LoginBus.DangNhap(ssTaiKhoan, ssMatKhau);

                if (null == db)
                {
                    ViewBag.thongBao = "Thông tin đăng nhập không đúng";
                    return View();
                }
                else
                {
                    // đăng thành công 
                    // check quyền
                    if (true == db.isAdmin) // chuyển đến trang admin
                    {
                        Session["TaiKhoanNV"] = db;
                        return Redirect("/Admin/MainAdmin/Index");
                    }
                    else
                    {
                        Session["TaiKhoanUser"] = db;
                        return Redirect("/Home/Index");
                    }
                }

                //    var nv = db.NhanViens.SingleOrDefault(n => n.TaiKhoanNV == ssTaiKhoan & n.MatKhauNV == ssMatKhau);
                //var kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoanKH == ssTaiKhoan & n.MatKhauKH == ssMatKhau);
                //if (nv == null)
                //{
                //    //ModelState.AddModelError("", "Tài khoản không hợp lệ !");
                //    //return View();
                //    if (kh == null)
                //    {
                //        ModelState.AddModelError("", "Sai tên đăng nhập hoặc mật khẩu !");
                //        return View();
                //    }
                //    else // tồn tại nhân viên
                //    {
                //        if (kh.TrangThai == 1)
                //        {
                //            ModelState.AddModelError("", "Tài Khoản của bạn đã bị khóa !");
                //            return View();
                //        }
                //        else
                //        {
                //            Session["TaiKhoan"] = kh;
                //            return Redirect("/KhachHang/Home/Index");
                //        }
                //    }
                //}
                //else if (nv.TrangThai == 1)
                //{
                //    ModelState.AddModelError("", "Tài khoản của bạn đã bị khóa !");
                //}
                //else
                //{
                //    Session["TaiKhoanNV"] = nv;
                //    return Redirect("/Admin/Home/Index");
                //}
            }
            return View();
        }
    }
}