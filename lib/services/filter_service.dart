import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FilterService {
  static Future<List<dynamic>> filterPets({
    String? petType,
    String? petBreed,
    String? petGender,
    int? petAge,
    String? petProvince,
    String? petShipping,
  }) async {
    final baseUrl = (Platform.isAndroid
            ? dotenv.env['API_ANDROID_URL']
            : dotenv.env['API_IOS_URL'])
        ?.replaceAll(RegExp(r'/$'), '');

    if (baseUrl == null) {
      print('Base URL is null');
      return [];
    }

    final queryParameters = <String, String>{};

    if (petType != null) queryParameters['pet_type'] = petType;
    if (petBreed != null) queryParameters['pet_breed'] = petBreed;
    if (petGender != null) queryParameters['pet_gender'] = petGender;
    if (petAge != null) queryParameters['pet_age'] = petAge.toString();
    if (petProvince != null) queryParameters['pet_province'] = petProvince;
    if (petShipping != null) queryParameters['pet_shipping'] = petShipping;

    final uri = Uri.parse('$baseUrl/api/filter/pets').replace(
      queryParameters: queryParameters.isEmpty ? null : queryParameters,
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data']; // สมมติ backend ส่งกลับ key 'data'
      } else {
        print('Failed to fetch pets: ${response.statusCode}');
        print(response.body);
        return [];
      }
    } catch (e) {
      print('Exception occurred while filtering pets: $e');
      return [];
    }
  }
}
