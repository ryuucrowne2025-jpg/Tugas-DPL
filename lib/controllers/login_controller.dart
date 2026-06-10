import 'package:get/get.dart';

class LoginController extends GetxController {
   final AuthRepository repository;

  LoginController({required this.repository});

  RxString username = ''.obs;
  RxString password = ''.obs;
  
  bool checkLogin(String username, String password) {
    return repository.login(username, password);
  }

  void login() {
    bool isValid = checkLogin(
      username.value,
      password.value,
    );

    if (isValid) {
     Get.snackbar('Success', 'Login berhasil');
      Get.offAllNamed('/home');
    } else {
     Get.snackbar('Error', 'Username atau Password salah');
      );
    }
  }
}
