class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int    _soLuongTonKho;
  bool   _trangThai;

//constructor
DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat, this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai);

//Getters
String get maDienThoai => _maDienThoai;
String get tenDienThoai => _tenDienThoai;
String get hangSanXuat => _hangSanXuat;
double get giaNhap => _giaNhap;
double get giaBan => _giaBan;
int    get soLuongTonKho => _soLuongTonKho;
bool   get trangThai => _trangThai;

//Setters
set maDienThoai(String maDienThoai){
  if (maDienThoai.isNotEmpty){
    _maDienThoai = maDienThoai;
  }
}

set tenDienThoai(String tenDienThoai){
  if(tenDienThoai.isNotEmpty){
    _tenDienThoai = tenDienThoai;
  }
}

set hangSanXuat(String hangSanXuat){
  if(hangSanXuat.isNotEmpty){
    _hangSanXuat = hangSanXuat;
  }
}

set giaNhap(double giaNhap){
  if(giaNhap > 0){
    _giaNhap = giaNhap;
  }
}

set giaBan(double giaBan){
  if(giaNhap > 0 && giaBan > giaNhap){
    _giaBan = giaBan;
  }
}

set soLuongTonKho(int soLuongTonKho){
  if(soLuongTonKho >= 0){
    _soLuongTonKho = soLuongTonKho;
  }
}

set trangThai(bool value){
  _trangThai = value;
}

//Phuong thuc tinh loi nhuan du kien
double tinhLoiNhuan() {
  if (_giaBan > _giaNhap) {
    return (_giaBan - _giaNhap) * _soLuongTonKho;
  }
  return 0.0;
}

// Phương thức kiểm tra có thể bán không
bool coTheBan() {
  return _trangThai && _soLuongTonKho > 0;
}


void hienThiThongTin(){
  print('Ma dien thoai: $_maDienThoai');
  print('Ten dien thoai: $_tenDienThoai');
  print('Hang san xuat: $_hangSanXuat');
  print('Gia nhap: $_giaNhap');
  print('Gia ban: $_giaBan');
  print('So luong ton kho: $_soLuongTonKho');
  print('Trang thai: ${_trangThai ? "Con kinh doanh" : "Ngung kinh doanh"}');
}
}