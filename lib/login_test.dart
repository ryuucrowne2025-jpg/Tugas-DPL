import 'package:flutter_test/flutter_test.dart';
import 'package:pelacakan_alumni2/controllers/login_controller.dart';

//  STUB DATA (test double)
class LoginStub {
  String username = "admin";
  String password = "admin123";
}

void main() {
  group('Login Test dengan STUB', () {

    test('Login berhasil (data benar)', () {
      final controller = LoginController();
      final stub = LoginStub();

      // pakai STUB
      final result = controller.checkLogin(stub.username, stub.password);

      expect(result, true);
    });

    test('Login gagal (data salah)', () {
      final controller = LoginController();

      final result = controller.checkLogin("user", "salah");

      expect(result, false);
    });

  });
}
