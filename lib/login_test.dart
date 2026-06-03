import 'package:flutter_test/flutter_test.dart';
import 'package:alumni_tracker/controllers/login_controller.dart';

void main() {
  late LoginController controller;

  setUp(() {
    controller = LoginController();
  });

  test(
    'Test login berhasil',
    () {
      bool result = controller.checkLogin(
        'admin',
        'admin123',
      );

      expect(result, true);
    },
  );
}
