import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:petvillage_app/models/message_model.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:petvillage_app/app/app.locator.dart';

class MessageService {
  final AuthService _authService = locator<AuthService>();

  final String baseUrl = Platform.isAndroid
      ? dotenv.env['API_ANDROID_URL']!
      : dotenv.env['API_IOS_URL']!;

  // 👉 สำหรับใช้ในหน้าแชทรายบุคคล
  Future<List<MessageModel>> fetchShopMessages(String shopId) async {
    try {
      final userId = _authService.getUserId();
      final roomId = '${shopId}_$userId';
      final base = baseUrl.substring(0, baseUrl.length - 1);
      final url = Uri.parse('$base/api/chat/userchats?userId=$roomId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isEmpty) return [];

        final lastMessage = data.last;
        return [MessageModel.fromJson(lastMessage)];
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      rethrow;
    }
  }

  // 👉 สำหรับใช้ในหน้า Message List (inbox)
  Future<List<MessageModel>> fetchUserMessages(String userId) async {
    try {
      final base = baseUrl.substring(0, baseUrl.length - 1);
      final url = Uri.parse('$base/api/chat/userchats?userId=$userId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => MessageModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load latest messages');
      }
    } catch (e) {
      rethrow;
    }
  }
}
