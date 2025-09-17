

import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthController {

  static final AuthController instance = AuthController();

  Future<void> login (String username, String password) async {
      http.Response response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': 'emilys', 
          'password': 'emilyspass', 
          'expiresInMins': 30
          }),
        );
      print(response.body);
      print(json.decode(response.body)['accessTokens']);
  }
}

