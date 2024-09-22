namespace GoodFoodAPI.DTOs
{
    public class DanhSachYeuThichDTO
    {
        public int Id { get; set; }
        public int IdNguoiDung { get; set; }
        public List<BaiVietDTO> BaiViet { get; set; } = new List<BaiVietDTO>();
        public List<QuanAnDetailDTO> QuanAn { get; set; } = new List<QuanAnDetailDTO>();
    }
}
