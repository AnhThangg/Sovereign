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
    }
}