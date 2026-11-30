using System;
using System.Globalization;

namespace WebTraSua.Models
{
    /// <summary>Định dạng tiền tệ theo chuẩn Việt Nam: 35000.000 -> "35.000" / "35.000 VNĐ".</summary>
    public static class TienTe
    {
        private static readonly CultureInfo Vi = CultureInfo.GetCultureInfo("vi-VN");

        /// <summary>Số tiền có dấu chấm ngăn cách hàng nghìn, không có phần lẻ. Ví dụ: 35.000</summary>
        public static string Tien(decimal? giaTri)
        {
            return (giaTri ?? 0m).ToString("N0", Vi);
        }

        /// <summary>Số tiền kèm đơn vị. Ví dụ: 35.000 VNĐ</summary>
        public static string VND(decimal? giaTri)
        {
            return Tien(giaTri) + " VNĐ";
        }
    }
}
