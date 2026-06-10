import 'auth_repository.dart';

class AuthRepositoryStub implements AuthRepository {
  @override
  bool login(String username, String password) {
    return username == 'admin' && password == 'admin123';
  }
}
