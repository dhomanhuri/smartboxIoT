import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future setToken(String token) async =>
      await _storage.write(key: 'token', value: token);

  static Future<String> getToken() async =>
      await _storage.read(key: 'token') ?? '';

  Future deleteSecureData(String key) async {
    var delete = await _storage.delete(key: key);
    return delete;
  }

  static deleteSecureAll() async {
    await _storage.deleteAll();
  }
}
