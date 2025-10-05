import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final AuthService instance = AuthService();
  late SharedPreferences _prefs;

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 60,
      }),
    );

    if (response.statusCode == 200) {
      _prefs = await SharedPreferences.getInstance();
      final data = json.decode(response.body);
      await _prefs.setString('accessToken', data['accessToken']);
      return true;
    }
    return false;
  }

  Future<bool> verifyToken() async {
    _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('accessToken');
    return token != null;
  }

  Future<void> logout() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.remove('accessToken');
  }

  Future<String?> getToken() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('accessToken');
  }
}
