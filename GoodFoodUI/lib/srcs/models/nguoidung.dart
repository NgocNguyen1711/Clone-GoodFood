class NguoiDungResponse {
  NguoiDungResponse({
    required this.id,
    required this.hoVaTen,
    required this.tenDangNhap,
    required this.soDienThoai,
    required this.ngaySinh,
    required this.matKhau,
    required this.email,
    required this.gioiTinh,
    required this.idHinhAnh,
    required this.loaiNguoiDung,
  });
  late final int id;
  late final String hoVaTen;
  late final String tenDangNhap;
  late final String soDienThoai;
  late final String ngaySinh;
  late final String matKhau;
  late final String email;
  late final String gioiTinh;
  late final int idHinhAnh;
  late final int loaiNguoiDung;

  NguoiDungResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hoVaTen = json['hoVaTen'];
    tenDangNhap = json['tenDangNhap'];
    soDienThoai = json['soDienThoai'];
    ngaySinh = json['ngaySinh'];
    matKhau = json['matKhau'];
    email = json['email'];
    gioiTinh = json['gioiTinh'];
    idHinhAnh = json['idHinhAnh'];
    loaiNguoiDung = json['loaiNguoiDung'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['hoVaTen'] = hoVaTen;
    data['tenDangNhap'] = tenDangNhap;
    data['soDienThoai'] = soDienThoai;
    data['ngaySinh'] = ngaySinh;
    data['matKhau'] = matKhau;
    data['email'] = email;
    data['gioiTinh'] = gioiTinh;
    data['idHinhAnh'] = idHinhAnh;
    data['loaiNguoiDung'] = loaiNguoiDung;
    return data;
  }
}
