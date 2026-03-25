import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "http://localhost:8080/api";

  static Future signup(String name, String email, String password) async {
    final res = await http.post(
      Uri.parse("$baseUrl/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    return jsonDecode(res.body);
  }

  static Future signin(String email, String password) async {
    final res = await http.post(
      Uri.parse("$baseUrl/signin"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    return jsonDecode(res.body);
  }
}
