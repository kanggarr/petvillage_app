import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class EditProfileService {
  Future<Map<String, dynamic>?> fetchUserProfile(String token) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/users/profile'
          : '${dotenv.env['API_IOS_URL']}api/users/profile',
    );

    try {
      final response = await http.get(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to fetch profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }

  Future<bool> updateUsername({
    required String token,
    required String username,
  }) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/users/update'
          : '${dotenv.env['API_IOS_URL']}api/users/update',
    );

    try {
      final response = await http.put(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'username': username}),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error updating username: $e');
      return false;
    }
  }

  Future<bool> updatePassword({
    required String token,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/users/password'
          : '${dotenv.env['API_IOS_URL']}api/users/password',
    );

    try {
      final response = await http.put(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'currentPassword': oldPassword,
          'newPassword': newPassword,
          'confirmPassword': confirmPassword,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error updating password: $e');
      return false;
    }
  }

  Future<bool> updateShopProfile(
      {required String token,
      required String shopName,
      required String address,
      required String shopProvince,
      required String shopDistrict,
      required String shopSubdistrict}) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/users/shops/update'
          : '${dotenv.env['API_IOS_URL']}api/users/shops/update',
    );

    try {
      final response = await http.put(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'shop_name': shopName,
          'shop_address': address,
          'shop_province': shopProvince,
          'shop_district': shopDistrict,
          'shop_subdistrict': shopSubdistrict,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      return response.statusCode == 200;
    } catch (e) {
      print('Error updating shop profile: $e');
      return false;
    }
  }
}
