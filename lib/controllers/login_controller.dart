import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  //  LOGIC (bisa di-test)
  bool checkLogin(String username, String password) {
    return username == 'admin' && password == 'admin123';
  }

  //  UI (tidak di-test)
  void login() {
    if (checkLogin(username.value, password.value)) {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Login gagal');
    }
  }
}
