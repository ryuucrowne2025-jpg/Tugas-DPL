import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  // ================================
  // LOGIC UTAMA (testable)
  // ================================
  bool checkLogin(String username, String password) {
    return username == 'admin' && password == 'admin123';
  }

  // ================================
  // VERSI LEBIH TESTABLE (bau stub)
  // ================================
  bool checkLoginWithCustomData(
    String username,
    String password, {
    String correctUsername = 'admin',
    String correctPassword = 'admin123',
  }) {
    return username == correctUsername && password == correctPassword;
  }

  // ================================
  // UI FUNCTION (tidak di-test)
  // ================================
  void login() {
    if (checkLogin(username.value, password.value)) {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Login gagal');
    }
  }
}
