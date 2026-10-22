import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String _baseUrl = 'https://reqres.in/api/users?page=1';

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> userList = data['data'];
      return userList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data dari server');
    }
  }
}