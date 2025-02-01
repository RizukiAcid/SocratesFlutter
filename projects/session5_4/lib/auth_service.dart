import 'local_storage_service.dart';

class AuthService {
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    final user = await _localStorageService.getUser();
    if (user != null && user['email'] == email && user['password'] == password) {
      return true;
    }
    return false;
  }

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    await _localStorageService.saveUser(email, password);
  }

  Future<void> signOut() async {
    await _localStorageService.clearUser();
  }

  Future<Map<String, String>?> getUser() async {
    return await _localStorageService.getUser();
  }
}