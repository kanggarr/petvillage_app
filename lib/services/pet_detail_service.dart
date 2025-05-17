import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/pet_model.dart';

class PetDetailService {
  static Future<List<PetModel>> fetchAllPets() async {
    try {
      final url = Uri.parse(
        Platform.isAndroid
            ? '${dotenv.env['API_ANDROID_URL']}api/pet/pets'
            : '${dotenv.env['API_IOS_URL']}api/pet/pets',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => PetModel.fromJson(json)).toList();
      } else {
        throw Exception('ไม่สามารถดึงข้อมูลสัตว์ได้ (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('เกิดข้อผิดพลาดในการเชื่อมต่อ: $e');
    }
  }
}
