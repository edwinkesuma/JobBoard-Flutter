import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  static const _jwtTokenKey = 'jwt_token';
  static const _userId = 'user_id';
  static const _userName = 'user_name';
  static const _userEmail = 'user_email';
  static const _userRole = 'user_role';

  Future<void> saveJwtToken(String token) async {
    await _storage.write(key: _jwtTokenKey, value: token);
  }

  Future<String?> getJwtToken() async {
    return await _storage.read(key: _jwtTokenKey);
  }

  Future<void> deleteJwtToken() async {
    await _storage.delete(key: _jwtTokenKey);
  }

  Future<void> saveUserData({
    required int id,
    required String name,
    required String email,
    required String role,
  }) async {
    await _storage.write(key: _userId, value: "$id");
    await _storage.write(key: _userName, value: name);
    await _storage.write(key: _userEmail, value: email);
    await _storage.write(key: _userRole, value: role);
  }

  Future<Map<String, dynamic>> getUserData() async {
    Map<String, dynamic> data = {};
    String? id = await _storage.read(key: _userId);
    String? name = await _storage.read(key: _userName);
    String? email = await _storage.read(key: _userEmail);
    String? role = await _storage.read(key: _userRole);

    data = {"id": int.parse(id!), "name": name, "email": email, "role": role};

    return data;
  }

  Future<void> deleteUserData() async {
    await _storage.delete(key: _userId);
    await _storage.delete(key: _userName);
    await _storage.delete(key: _userEmail);
    await _storage.delete(key: _userRole);
  }
}
