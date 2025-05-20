import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:petvillage_app/models/chat_room_model.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:petvillage_app/app/app.locator.dart';

class ChatRoomService {
  final AuthService _authService = locator<AuthService>();

  late final String _base;
  ChatRoomService() {
    final raw = Platform.isAndroid
        ? dotenv.env['API_ANDROID_URL']!
        : dotenv.env['API_IOS_URL']!;
    _base = raw.endsWith('/') ? raw.substring(0, raw.length - 1) : raw;
  }

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_authService.getToken()}',
      };

  /// Fetch all chat rooms for the current user
  Future<List<ChatRoom>> getUserRooms() async {
    final uri = Uri.parse('$_base/api/chat/userchats');
    final resp = await http.get(uri, headers: _headers);
    if (resp.statusCode == 200) {
      final List<dynamic> list = jsonDecode(resp.body);
      return list.map((j) => ChatRoom.fromJson(j)).toList();
    } else {
      throw Exception('Error fetching chat rooms (${resp.statusCode})');
    }
  }

  /// Create a new chat room between [userId] and [shopId] with an optional [roomName]
  Future<ChatRoom> createRoom({
    required String userId,
    required String shopId,
    String? roomName,
  }) async {
    final uri = Uri.parse('$_base/api/chat/createroom');
    final body = jsonEncode({
      'userId':
          userId, // เปลี่ยนจาก 'user' เป็น 'userId' เพื่อให้สอดคล้องกับ API
      'shopId': shopId, // เปลี่ยนจาก 'shop' เป็น 'shopId'
      if (roomName != null) 'roomName': roomName,
    });

    final resp = await http.post(uri, headers: _headers, body: body);
    if (resp.statusCode == 201) {
      final json = jsonDecode(resp.body);
      return ChatRoom.fromJson(
          json['chatroom']); // ปรับให้เข้าถึงฟิลด์ 'chatroom'
    } else {
      throw Exception('Error creating room (${resp.statusCode})');
    }
  }

  /// Fetch a single chat room by its [roomId], includes latest message
  Future<ChatRoom> getRoomById(String roomId) async {
    final uri = Uri.parse('$_base/api/chat/room/$roomId');
    final resp = await http.get(uri, headers: _headers);
    if (resp.statusCode == 200) {
      return ChatRoom.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception('Error fetching room (${resp.statusCode})');
    }
  }
}
