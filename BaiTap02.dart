//BaiTap02.dart
//Giai pt bac 2: ax^2+bx+c = 0;
import 'dart:io';
import 'dart:math';


void giaiPhuongTrinhBacHai(double a, double b, double c) {
  if (a == 0) {
    if (b == 0) {
      if (c == 0) {
        print("Phương trình vô số nghiệm.");
      } else {
        print("Phương trình vô nghiệm.");
      }
    } else {
      double x = -c / b;
      print("Phương trình có nghiệm duy nhất: x = $x");
    }
  } else {
    double delta = b * b - 4 * a * c;
    if (delta < 0) {
      print("Phương trình vô nghiệm.");
    } else if (delta == 0) {
      double x = -b / (2 * a);
      print("Phương trình có nghiệm kép: x = $x");
    } else {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      print("Phương trình có hai nghiệm phân biệt: x1 = $x1, x2 = $x2");
    }
  }
}
void main(){
  stdout.write('Nhap he so a (a != 0): ');
  String? inputA = stdin.readLineSync();
  double a = double.tryParse(inputA ?? '') ?? 0;

  while (a == 0){
    stdout.write('He so khong dung. Vui long nhap lai!! : ');
    inputA = stdin.readLineSync();
    a = double.tryParse(inputA ?? '') ?? 0;
  }

  stdout.write('Nhap he so b: ');
  String? inputB = stdin.readLineSync();
  double b = double.tryParse(inputB ?? '') ?? 0;

  stdout.write('Nhập hệ số c: ');
  String? inputC = stdin.readLineSync();
  double c = double.tryParse(inputC ?? '') ?? 0;

  print('Giai phuong trinh: ${a}x^2 + ${b}x + $c = 0');
  giaiPhuongTrinhBacHai(a, b, c);

}