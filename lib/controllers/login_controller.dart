import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  void login() {
    if (username.value == 'admin' && password.value == 'admin123') {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Login gagal');
    }
  }
}
