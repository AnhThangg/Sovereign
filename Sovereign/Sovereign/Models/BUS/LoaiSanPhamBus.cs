using SovereignConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sovereign.Models.BUS
{
    public class LoaiSanPhamBus
    {
        //----------------------Khách hàng
        public static IEnumerable<Category> DanhSach()
        {
            var db = new SovereignConnectionDB();
            return db.Query<Category>("select * from Category");
        }

        public static IEnumerable<Product> ChiTiet(String id)
        {
            var db = new SovereignConnectionDB();
            return db.Query<Product>("select * from Product where Category_Id = '"+id+"'");
        }

        //-------------------------Admin
        public static void ThemLSP(Category lsp)
        {
            var db = new SovereignConnectionDB();
            db.Insert(lsp);
        }

        public static IEnumerable<Category> DanhSachAdmin()
        {
            var db = new SovereignConnectionDB();
            return db.Query<Category>("select * from Category");
        }

        public static Category ChiTietAdmin(string id)
        {
            var db = new SovereignConnectionDB();
            return db.SingleOrDefault<Category>("select * from Category where Category_Id = '" + id + "'");
        }

        public static void UpdateLSP(String id, Category lsp)
        {
            var db = new SovereignConnectionDB();
            db.Update(lsp,id);
        }

        public static void XoaLSP(String id)
        {
            var db = new SovereignConnectionDB();
            db.Delete<Category>("WHERE Category_Id = @0", id);
        }
    }
}