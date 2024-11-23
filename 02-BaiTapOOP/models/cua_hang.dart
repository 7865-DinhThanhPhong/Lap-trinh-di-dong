import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang({
    required String tenCuaHang,
    required String diaChi,
  })  : _tenCuaHang = tenCuaHang,
        _diaChi = diaChi;

  // Them dien thoai
  void themDienThoai(DienThoai dienThoai) {
    if (_danhSachDienThoai.any((dt) => dt.maDienThoai == dienThoai.maDienThoai)) {
      throw ArgumentError("Dien thoai voi ma ${dienThoai.maDienThoai} da ton tai.");
    }
    _danhSachDienThoai.add(dienThoai);
    print("Them dien thoai ${dienThoai.tenDienThoai} thanh cong!");
  }

  // Phuong thuc cap nhat dien thoai
  void capNhatDienThoai(String maDienThoai,
      {String? ten,
      String? hang,
      double? giaNhap,
      double? giaBan,
      int? soLuongTon,
      bool? trangThai}) {
    final dienThoai = _danhSachDienThoai.firstWhere(
      (dt) => dt.maDienThoai == maDienThoai,
      orElse: () =>
          throw ArgumentError("Khong tim thay dien thoai voi ma $maDienThoai."),
    );

    if (ten != null) dienThoai.tenDienThoai = ten;
    if (hang != null) dienThoai.hangSanXuat = hang;
    if (giaNhap != null) dienThoai.giaNhap = giaNhap;
    if (giaBan != null) dienThoai.giaBan = giaBan;
    if (soLuongTon != null) dienThoai.soLuongTonKho = soLuongTon;
    if (trangThai != null) dienThoai.trangThai = trangThai;

    print("Cap nhat thanh cong!");
  }

  // Ngung kinh doanh dien thoai
  void ngungKinhDoanh(String maDienThoai) {
    final dienThoai = _danhSachDienThoai.firstWhere(
      (dt) => dt.maDienThoai == maDienThoai,
      orElse: () =>
          throw ArgumentError("Khong tim thay dien thoai voi ma $maDienThoai."),
    );
    dienThoai.trangThai = false;
    print("Đien thoai ${dienThoai.tenDienThoai} da ngung kinh doanh.");
  }

  // Tim dien thoai
  List<DienThoai> timKiemDienThoai({String? ma, String? ten, String? hang}) {
    return _danhSachDienThoai.where((dt) {
      final matchMa = ma == null || dt.maDienThoai.contains(ma);
      final matchTen = ten == null || dt.tenDienThoai.contains(ten);
      final matchHang = hang == null || dt.hangSanXuat.contains(hang);
      return matchMa && matchTen && matchHang;
    }).toList();
  }

  // Hien thi danh sach dien thoai
  void hienThiDanhSachDienThoai() {
    if (_danhSachDienThoai.isEmpty) {
      print("Danh sach dien thoai trong.");
      return;
    }
    for (var dienThoai in _danhSachDienThoai) {
      dienThoai.hienThiThongTin();
    }
  }

  // Danh sach hoa don
  void hienThiDanhSachHoaDon() {
    if (_danhSachHoaDon.isEmpty) {
      print("Danh sach hoa don trong.");
      return;
    }
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTinHoaDon();
    }
  }

  // Tinh tong doanh thu cua cua hang
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon.where((hd) {
      return hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay);
    }).fold(0, (tong, hoaDon) => tong + hoaDon.tinhTongTien());
  }

// Thong ke ton kho
  void thongKeTonKho() {
    for (var dienThoai in _danhSachDienThoai) {
      print("Ten: ${dienThoai.tenDienThoai}, Ton kho: ${dienThoai.soLuongTonKho}");
    }
  }
}