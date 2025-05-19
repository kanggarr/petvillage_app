import 'dart:convert';
import 'dart:io'; // สำหรับ Platform
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<String?> fetchUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) return null;

    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/users/profile'
          : '${dotenv.env['API_IOS_URL']}api/users/profile',
    );

    final response = await http.get(
      url,
      headers: {
        'authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['username']; // หรือ 'name' ตามที่ backend ส่ง
    } else {
      print('Failed to load profile: ${response.statusCode}');
      return null;
    }
  }
}
