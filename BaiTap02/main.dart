import '../BaiTap02.dart/ThuVien.dart';
import 'Sach.dart';
import 'DocGia.dart';

void main() {
  // Tạo thư viện
  ThuVien thuVien = ThuVien();

  // Tạo một số sách
  Sach sach1 = Sach("S001", "Lập trình Dart", "Nguyễn Văn A", "Chưa mượn");
  Sach sach2 = Sach("S002", "Flutter cơ bản", "Lê Thị B", "Chưa mượn");
  Sach sach3 = Sach("S003", "Học lập trình Java", "Trần Văn C", "Chưa mượn");

  // Tạo một số độc giả
  DocGia docGia1 = DocGia("DG001", "Trần Văn D");
  DocGia docGia2 = DocGia("DG002", "Nguyễn Thị E");

  // Thêm sách và độc giả vào thư viện
  thuVien.themSach(sach1);
  thuVien.themSach(sach2);
  thuVien.themSach(sach3);

  thuVien.themDocGia(docGia1);
  thuVien.themDocGia(docGia2);

  // Hiển thị danh sách sách và độc giả
  thuVien.hienThiDanhSachSach();
  thuVien.hienThiDanhSachDocGia();

  // Quy trình mượn sách
  print("\n=== Quy trình mượn sách ===");
  thuVien.muonSach("DG001", "S001");
  thuVien.muonSach("DG002", "S001"); // Sách đã được mượn
  thuVien.muonSach("DG002", "S002");

  // Hiển thị danh sách sách sau khi mượn
  print("\nDanh sách sách sau khi mượn:");
  thuVien.hienThiDanhSachSach();

  // Quy trình trả sách
  print("\n=== Quy trình trả sách ===");
  thuVien.traSach("DG001", "S001");
  thuVien.traSach("DG002", "S002");

  // Hiển thị danh sách sách sau khi trả
  print("\nDanh sách sách sau khi trả:");
  thuVien.hienThiDanhSachSach();
}
