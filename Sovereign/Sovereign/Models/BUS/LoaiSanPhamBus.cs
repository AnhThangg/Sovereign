using SovereignConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sovereign.Models.BUS
{
    public class LoaiSanPhamBus
    {
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
    }
}