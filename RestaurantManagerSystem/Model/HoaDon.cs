//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RestaurantManagerSystem.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class HoaDon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HoaDon()
        {
            this.ChiTietHDs = new HashSet<ChiTietHD>();
        }
    
        public int SoHD { get; set; }
        public Nullable<System.DateTime> ThoiGianLap { get; set; }
        public Nullable<int> MaSoBan { get; set; }
        public Nullable<int> SoKhach { get; set; }
        public Nullable<int> MaNVLap { get; set; }
        public Nullable<int> MaNVTT { get; set; }
        public Nullable<double> TongTien { get; set; }
    
        public virtual BanAn BanAn { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHD> ChiTietHDs { get; set; }
        public virtual NhanVien NhanVien { get; set; }
        public virtual NhanVien NhanVien1 { get; set; }
    }
}
