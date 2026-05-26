import 'package:get/get.dart';

// 1. Buat abstract class atau interface
abstract class AuthService {
  bool validateUser(String username, String password);
}

// 2. Implementasi asli (untuk production)
class RealAuthService implements AuthService {
  @override
  bool validateUser(String username, String password) {
    return username == 'admin' && password == 'admin123';
  }
}

// 3. Controller dengan dependensi injection
class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  final AuthService authService;
  
  // Constructor injection
  LoginController({required this.authService});
  
  void login() {
    if (authService.validateUser(username.value, password.value)) {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Login gagal');
    }
  }
}
