class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  String _trangThaiMuon;

  // Constructor
  Sach(this._maSach, this._tenSach, this._tacGia, this._trangThaiMuon);

  // Getters
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  String get trangThaiMuon => _trangThaiMuon;

  // Setters
  set maSach(String maSach) {
    if (maSach.isNotEmpty) {
      _maSach = maSach;
    }
  }

  set tenSach(String tenSach) {
    if (tenSach.isNotEmpty) {
      _tenSach = tenSach;
    }
  }

  set tacGia(String tacGia) {
    if (tacGia.isNotEmpty) {
      _tacGia = tacGia;
    }
  }

  set trangThaiMuon(String trangThaiMuon) {
    if (trangThaiMuon.isNotEmpty) {
      _trangThaiMuon = trangThaiMuon;
    }
  }

  // Hiển thị thông tin sách
  void hienThiThongTinSach() {
    print("Tên sách: $_tenSach");
    print("Mã sách: $_maSach");
    print("Tác giả: $_tacGia");
    print("Trạng thái: $_trangThaiMuon");
  }
}
