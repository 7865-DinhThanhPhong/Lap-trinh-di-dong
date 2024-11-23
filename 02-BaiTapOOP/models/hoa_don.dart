import '../models/dien_thoai.dart';

class HoaDon {
  static int _soThuTu = 1;
  String     _maHoaDon;
  DateTime   _ngayBan;
  DienThoai  _dienThoaiDuocBan;
  int        _soLuongMua;
  double     _giaBanThucTe;
  String     _tenKhachHang;
  String     _soDienThoaiKhachHang;

//constructor
HoaDon(this._maHoaDon, this._ngayBan, this._dienThoaiDuocBan, this._soLuongMua, this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhachHang);

//Getters
String get maHoaDon => _maHoaDon;
DateTime get ngayBan => _ngayBan;
DienThoai get dienThoaiDuocban => _dienThoaiDuocBan;
int get soLuongMua => _soLuongMua;
double get giaBanThucTe =>_giaBanThucTe;
String get tenKhachHang => _tenKhachHang;
String get soDienThoaiKhachHang => _soDienThoaiKhachHang;

//Setters
set maHoaDon(String maHoaDon){
  _maHoaDon = _generateMaHoaDon();
}
//Tao ma hoa don tu dong
static String _generateMaHoaDon(){
  String ma = 'HD${_soThuTu.toString().padLeft(3, '0')}';
  _soThuTu++;
  return ma;
}

set ngayBan(DateTime ngayBan){
  _ngayBan = DateTime.now();
}

set dienThoaiDuocban(DienThoai dienThoaiDuocban){
  _dienThoaiDuocBan = dienThoaiDuocban;
}

set soLuongMua(int soLuongMua){
  if(soLuongMua <= 0 || soLuongMua > dienThoaiDuocban.soLuongTonKho){
    throw ArgumentError('So luong mua khong hop le!');
  }
}

//Phuong thuc tinh tong tien
double tinhTongTien(){
  return _giaBanThucTe * _soLuongMua;
}

/*/Phuong thuc tinh loi nhuan thuc te
double tinhLoiNhuanThucTe(){
  return (_giaBanThucTe - _dienThoaiDuocBan.giaNhap()) * _soLuongMua;
}*/

void hienThiThongTinHoaDon() {
  print('Ma hoa don: $_maHoaDon');
  print('Ngay ban: $_ngayBan');
  print('Ten khach hang: $_tenKhachHang');
  print('So dien thoai khach hang: $_soDienThoaiKhachHang');
  print('Ten dien thoai: $_dienThoaiDuocBan');
  print('Số lượng mua: $_soLuongMua');
  print('Giá bán thực tế: $_giaBanThucTe');
  print('Tổng tiền: ${tinhTongTien()}');
  //print('Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}');
}
}