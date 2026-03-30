import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  static const _jwtTokenKey = 'jwt_token';

  Future<void> saveJwtToken(String token) async {
    await _storage.write(key: _jwtTokenKey, value: token);
  }

  Future<String?> getJwtToken() async {
    return await _storage.read(key: _jwtTokenKey);
  }

  Future<void> deleteJwtToken() async {
    await _storage.delete(key: _jwtTokenKey);
  }
}
