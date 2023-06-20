using SovereignConnection;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sovereign.Models.BUS
{
    public class SovereignBus
    {
        public static IEnumerable<Product> DanhSach()
        {
            var db = new SovereignConnectionDB();
            return db.Query<Product>("select * from Product where Amount <> 0");
        }

        public static Product ChiTiet (string id)
        {
            var db = new SovereignConnectionDB();
            return db.SingleOrDefault<Product> ("select * from Product where Product_Id =@0", id);
        }

        //--------------------------------Admin
        public static IEnumerable<Product> DanhSachSP()
        {
            var db = new SovereignConnectionDB();
            return db.Query<Product>("select * from Product");
        }

        public static Product ChiTietAdmin(String id)
        {
            var db = new SovereignConnectionDB();
            return db.SingleOrDefault<Product>("select * from Product where Product_Id = '" + id + "'");
        }

        public static void InsertSP(Product sp)
        {
            var db = new SovereignConnectionDB();
            db.Insert(sp);
        }

        public static void UpdateSP(String id, Product sp)
        {
            var db = new SovereignConnectionDB();
            db.Update(sp, id);
        }

        public static void XoaSP(String id)
        {
            var db = new SovereignConnectionDB();
            db.Delete<Product>("WHERE Product_Id = @0", id);
        }
    }
}