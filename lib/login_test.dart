import 'package:flutter_test/flutter_test.dart';
import 'package:alumni_tracker/controllers/login_controller.dart';

void main() {
  late LoginController controller;

  setUp(() {
    controller = LoginController();
  });

  group('LoginController Unit Test', () {

    test(
      'Test 1: Login berhasil jika username dan password benar',
      () {
        bool result = controller.checkLogin(
          'admin',
          'admin123',
        );

        expect(result, true);
      },
    );

    test(
      'Test 2: Login gagal jika username salah',
      () {
        bool result = controller.checkLogin(
          'user',
          'admin123',
        );

        expect(result, false);
      },
    );

    test(
      'Test 3: Login gagal jika password salah',
      () {
        bool result = controller.checkLogin(
          'admin',
          'passwordSalah',
        );

        expect(result, false);
      },
    );

    test(
      'Test 4: Login gagal jika username dan password kosong',
      () {
        bool result = controller.checkLogin(
          '',
          '',
        );

        expect(result, false);
      },
    );

    test(
      'Test 5: Login gagal jika hanya username diisi',
      () {
        bool result = controller.checkLogin(
          'admin',
          '',
        );

        expect(result, false);
      },
    );

  });
}
