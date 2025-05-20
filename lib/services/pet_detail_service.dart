import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:petvillage_app/models/animal_type_model.dart';
import 'package:petvillage_app/models/breeds_model.dart';
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

  Future<List<AnimalTypeModel>> getAnimalTypes() async {
    try {
      final url = Uri.parse(
        Platform.isAndroid
            ? '${dotenv.env['API_ANDROID_URL']}api/pet/types'
            : '${dotenv.env['API_IOS_URL']}api/pet/types',
      );

      final response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => AnimalTypeModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'ไม่สามารถดึงข้อมูลประเภทสัตว์ได้ (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('เกิดข้อผิดพลาดในการเชื่อมต่อ: $e');
    }
  }

  Future<List<Breed>> getBreedByType(String type) async {
    try {
      final url = Uri.parse(
        Platform.isAndroid
            ? '${dotenv.env['API_ANDROID_URL']}api/pet/breeds/$type'
            : '${dotenv.env['API_IOS_URL']}api/pet/breeds/$type',
      );

      final response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = jsonDecode(response.body);
        print("data breeds ${data}");
        return data.map((json) => Breed.fromJson(json)).toList();
      } else {
        throw Exception(
            'ไม่สามารถดึงข้อมูลพันธุ์สัตว์ได้ (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('เกิดข้อผิดพลาดในการเชื่อมต่อ: $e');
    }
  }
}
