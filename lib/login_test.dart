import 'package:flutter_test/flutter_test.dart';
import 'package:alumni_tracker/controllers/login_controller.dart';

void main() {
  late LoginController controller;

  setUp(() {
    controller = LoginController();
  });

  test('Login berhasil jika username dan password benar', () {
    bool result = controller.checkLogin(
      'admin',
      'admin123',
    );

    expect(result, true);
  });

  test('Login gagal jika username salah', () {
    bool result = controller.checkLogin(
      'user',
      'admin123',
    );

    expect(result, false);
  });

  test('Login gagal jika password salah', () {
    bool result = controller.checkLogin(
      'admin',
      'salah',
    );

    expect(result, false);
  });
}
