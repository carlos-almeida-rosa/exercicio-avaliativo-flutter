import 'dart:convert';
import 'package:flutter_avaliativo/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final AuthService instance = AuthService();
  late SharedPreferences _prefs;

  Future<bool> login(String username, String password) async {
    http.Response response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 60,
      }),
    );

    if (response.statusCode == 200) {
      _prefs = await SharedPreferences.getInstance();
      _prefs.setString(
        'accessToken',
        json.decode(response.body)['accessToken'],
      );
      return true;
    } else {
      return false;
    }

    // user = User(
    //   firstName: json.decode(response.body)['firstName'],
    //   lastName: json.decode(response.body)['lastName'],
    //   email: json.decode(response.body)['email'],
    //   username: json.decode(response.body)['username'],
    //   password: json.decode(response.body)['password'],
    //   accessToken: json.decode(response.body)['accessToken'],
    // );
  }

  Future<bool> verifyToken() async {
    _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('accessToken');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
