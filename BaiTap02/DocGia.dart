import 'Sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _danhSachMuon = [];

  // Constructor
  DocGia(this._maDocGia, this._hoTen);

  // Getters
  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get danhSachMuon => _danhSachMuon;

  // Setters
  set maDocGia(String maDocGia) {
    if (maDocGia.isNotEmpty) {
      _maDocGia = maDocGia;
    }
  }

  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  // Phương thức mượn sách
  void muonSach(Sach sach) {
    if (sach.trangThaiMuon == "Chưa mượn") {
      _danhSachMuon.add(sach);
      sach.trangThaiMuon = "Đã mượn"; // Cập nhật trạng thái sách
      print("Độc giả $_hoTen đã mượn sách: ${sach.tenSach}");
    } else {
      print("Sách '${sach.tenSach}' đã có người mượn.");
    }
  }

  // Phương thức trả sách
  void traSach(Sach sach) {
    if (_danhSachMuon.contains(sach)) {
      _danhSachMuon.remove(sach);
      sach.trangThaiMuon = "Chưa mượn"; // Cập nhật trạng thái sách
      print("Độc giả $_hoTen đã trả sách: ${sach.tenSach}");
    } else {
      print("Sách '${sach.tenSach}' không nằm trong danh sách mượn.");
    }
  }

  // Hiển thị thông tin độc giả
  void hienThiThongTin() {
    print("Mã độc giả: $_maDocGia");
    print("Họ tên: $_hoTen");
    print("Danh sách sách đang mượn:");
    for (var sach in _danhSachMuon) {
      print(" - ${sach.tenSach} (Tác giả: ${sach.tacGia})");
    }
  }
}
