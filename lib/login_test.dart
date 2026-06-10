import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:your_project_name/controllers/login_controller.dart';

void main() {
  setUpAll(() {
    Get.testMode = true; 
  });

  group('LoginController Unit Test', () {
    late LoginController loginController;

    setUp(() {
      loginController = LoginController();
    });

    test('checkLogin returns true with valid credentials', () {
      final result = loginController.checkLogin('admin', 'admin123');
      expect(result, isTrue);
    });

     test('checkLogin returns false with invalid credentials', () {
      final result = controller.checkLogin('user', '123');
      expect(result, isFalse);
    });

    test('login process success with correct reactive values', () {
      loginController.username.value = 'admin';
      loginController.password.value = 'admin123';

     controller.login();

      expect(loginController.username.value, 'admin');
      expect(loginController.password.value, 'admin123');
    });
  });
}
