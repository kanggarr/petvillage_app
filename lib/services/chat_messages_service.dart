import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatMessagesService {
  final _authService = locator<AuthService>();
  IO.Socket? _socket;

  late final String _base;
  ChatMessagesService() {
    final raw = Platform.isAndroid
        ? dotenv.env['API_ANDROID_URL']!
        : dotenv.env['API_IOS_URL']!;
    _base = raw.endsWith('/') ? raw.substring(0, raw.length - 1) : raw;
  }

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_authService.getToken()}',
      };

  /// Fetch all messages for the current room
  Future<List<Map<String, dynamic>>> fetchMessages({
    int page = 1,
    int limit = 50,
  }) async {
    final roomId = _authService.getRoomId();
    final uri =
        Uri.parse('$_base/api/chat/room/$roomId').replace(queryParameters: {
      'page': page.toString(),
      'limit': limit.toString(),
    });

    final resp = await http.get(uri, headers: _headers);
    if (resp.statusCode == 200) {
      final List<dynamic> list = jsonDecode(resp.body);
      return list.cast<Map<String, dynamic>>();
    } else {
      throw Exception(
          'Failed to fetch messages (${resp.statusCode}): ${resp.body}');
    }
  }

  /// Send a new message to the current room
  Future<Map<String, dynamic>> sendMessage(String content) async {
    final roomId = _authService.getRoomId();
    final uri = Uri.parse('$_base/api/chat/send');

    final resp = await http.post(
      uri,
      headers: _headers,
      body: jsonEncode({'roomId': roomId, 'content': content}),
    );

    if (resp.statusCode == 201) {
      final Map<String, dynamic> msg = jsonDecode(resp.body);
      // Emit over socket for real-time
      _socket?.emit('newMessage', {'roomId': roomId, 'message': msg});
      return msg;
    } else {
      final Map<String, dynamic> err = jsonDecode(resp.body);
      throw Exception(err['error'] ?? 'Send failed (${resp.statusCode})');
    }
  }

  /// Mark all unread messages as read by current user
  Future<void> markAsRead() async {
    final roomId = _authService.getRoomId();
    final userId = _authService.getUserId();
    final uri = Uri.parse('$_base/api/chat/read');

    final resp = await http.post(
      uri,
      headers: _headers,
      body: jsonEncode({'roomId': roomId, 'userId': userId}),
    );

    if (resp.statusCode != 200) {
      throw Exception('Failed to mark read (${resp.statusCode})');
    }
  }

  /// Delete (soft) a message by ID
  Future<void> deleteMessage(String messageId) async {
    final userId = _authService.getUserId();
    final uri = Uri.parse('$_base/api/chat/delete');

    final resp = await http.post(
      uri,
      headers: _headers,
      body: jsonEncode({'messageId': messageId, 'userId': userId}),
    );

    if (resp.statusCode != 200) {
      throw Exception('Failed to delete (${resp.statusCode})');
    }
  }

  /// Connect to Socket.IO and join the room
  void connectSocket(Function(Map<String, dynamic>) onMessage) {
    final raw = Platform.isAndroid
        ? dotenv.env['API_ANDROID_URL']!
        : dotenv.env['API_IOS_URL']!;
    final wsUrl = raw.replaceFirst(RegExp(r'^http'), 'ws');
    _socket = IO.io(wsUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {'token': _authService.getToken()},
    });

    _socket!
      ..connect()
      ..onConnect((_) {
        final roomId = _authService.getRoomId();
        _socket?.emit('joinRoom', roomId);
      })
      ..on('newMessage', (data) {
        // data: { roomId, message }
        if (data is Map<String, dynamic>) {
          onMessage(data['message'] as Map<String, dynamic>);
        }
      })
      ..onDisconnect((_) => print('Socket disconnected'));
  }

  /// Disconnect the socket when done
  void disconnectSocket() {
    _socket?.disconnect();
    _socket = null;
  }
}
