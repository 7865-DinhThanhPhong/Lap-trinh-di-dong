import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

class Test {
  static void main() {
    // Tạo đối tượng cửa hàng
    var cuaHang = CuaHang(tenCuaHang: 'Cửa hàng Điện Thoại ABC', diaChi: '123 Đường A, TP HCM');

    // **1. Tạo và quản lý thông tin điện thoại**
    try {
      // Thêm điện thoại mới
      var dienThoai1 = DienThoai('DT001', 'iPhone 14 Pro', 'Apple', 20000000, 30000000, 10, true);
      var dienThoai2 = DienThoai('DT002', 'Galaxy S23', 'Samsung', 15000000, 25000000, 5, true);
      cuaHang.themDienThoai(dienThoai1);
      cuaHang.themDienThoai(dienThoai2);

      // Hiển thị danh sách điện thoại
      print('Danh sách điện thoại sau khi thêm:');
      cuaHang.hienThiDanhSachDienThoai();

      // Cập nhật thông tin
      cuaHang.capNhatDienThoai('DT001', giaBan: 32000000, soLuongTon: 8);

      // Kiểm tra validation khi thêm điện thoại bị trùng mã
      try {
        cuaHang.themDienThoai(DienThoai('DT001', 'iPhone 13', 'Apple', 15000000, 25000000, 5, true));
      } catch (e) {
        print('Lỗi: $e');
      }

    } catch (e) {
      print('Lỗi khi quản lý điện thoại: $e');
    }

    // **2. Tạo và quản lý hóa đơn**
    try {
      // Tạo hóa đơn hợp lệ
      var hoaDon1 = HoaDon('HD001', DateTime.now(), cuaHang.timKiemDienThoai(ma: 'DT001').first, 2, 32000000, 'Nguyễn Văn A', '0901234567');
      cuaHang.hienThiDanhSachHoaDon();

      // Kiểm tra ràng buộc tồn kho
      try {
        var hoaDon2 = HoaDon('HD002', DateTime.now(), cuaHang.timKiemDienThoai(ma: 'DT001').first, 20, 32000000, 'Trần Văn B', '0902345678');
      } catch (e) {
        print('Lỗi tồn kho: $e');
      }

      // Tính toán tổng tiền hóa đơn
      print('Hóa đơn 1 tổng tiền: ${hoaDon1.tinhTongTien()}');

    } catch (e) {
      print('Lỗi khi quản lý hóa đơn: $e');
    }

    // **3. Thống kê báo cáo**
    try {
      // Thống kê doanh thu theo thời gian
      var doanhThu = cuaHang.tinhTongDoanhThu(DateTime(2024, 1, 1), DateTime.now());
      print('Tổng doanh thu từ 01/01/2024 đến hiện tại: $doanhThu');

      // Báo cáo tồn kho
      print('Thống kê tồn kho:');
      cuaHang.thongKeTonKho();

    } catch (e) {
      print('Lỗi khi thống kê báo cáo: $e');
    }
  }
}

void main() {
  Test.main();
}
