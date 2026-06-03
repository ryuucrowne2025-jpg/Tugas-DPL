import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  // ===============================
  // STUB FUNCTION (UNTUK TESTING)
  // ===============================
  bool checkLogin(String username, String password) {
    if (username == 'admin' && password == 'admin123') {
      return true;
    }
    return false;
  }

  // ===============================
  // IMPLEMENTASI LOGIN
  // ===============================
  void login() {
    bool isValid = checkLogin(username.value, password.value);

    if (isValid) {
      Get.snackbar('Success', 'Login berhasil');
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Username atau Password salah');
    }
  }
}
