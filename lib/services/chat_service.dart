import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatService {
  final _authService = locator<AuthService>();
  IO.Socket? _socket;

  /// ✅ ดึงข้อความแชททั้งหมดจาก room
  Future<List<Map<String, dynamic>>> fetchMessages() async {
    final roomId = _authService.getRoomId();
    print("✅ roomId : $roomId");
    final token = _authService.getToken();
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/chat/room/$roomId'
          : '${dotenv.env['API_IOS_URL']}api/chat/room/$roomId',
    );

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> messages = jsonDecode(response.body);
        return messages.map((msg) => msg as Map<String, dynamic>).toList();
      } else {
        throw Exception('ไม่สามารถโหลดข้อความได้');
      }
    } catch (e) {
      throw Exception('เกิดข้อผิดพลาดขณะโหลดข้อความ: $e');
    }
    // return [];
  }

  /// ✅ ส่งข้อความใหม่เข้าไปในห้องแชท
  /// ✅ ส่งข้อความใหม่เข้าไปในห้องแชท
  Future<void> sendMessage(String content) async {
    final roomId = _authService.getRoomId();
    final senderId = _authService.getUserId();
    final token = _authService.getToken();
    print("✅ roomId : $roomId");
    print("✅ senderId : $senderId");
    print("✅ token : $token");

    // Validate inputs
    if (roomId == null || content.isEmpty || token == null) {
      throw Exception('roomId, content, or token is missing');
    }

    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/chat/send'
          : '${dotenv.env['API_IOS_URL']}api/chat/send',
    );

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'roomId': roomId,
          'content': content,
        }),
      );

      if (response.statusCode == 201) {
        // ✅ Emit to socket for real-time update
        _socket?.emit('newMessage', {
          'roomId': roomId,
          'message': {
            'roomId': roomId,
            'sender': senderId,
            'content': content,
            'senderType':
                _authService.getUserRole() == 'shop' ? 'Shop' : 'User',
          },
        });
      } else {
        final data = jsonDecode(response.body);
        throw Exception(
            data['error'] ?? 'ส่งข้อความไม่สำเร็จ: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending message: $e');
      throw Exception('เกิดข้อผิดพลาดในการส่งข้อความ: $e');
    }
  }

  /// ✅ เริ่มการเชื่อมต่อ socket กับ server
  void connectSocket(Function(Map<String, dynamic>) onMessageReceived) {
    final roomId = _authService.getRoomId();
    final uri = Platform.isAndroid
        ? dotenv.env['API_ANDROID_URL']!.replaceFirst('http', 'ws')
        : dotenv.env['API_IOS_URL']!.replaceFirst('http', 'ws');

    _socket = IO.io(
      uri,
      IO.OptionBuilder()
          .setTransports(['websocket']) // ❗ สำคัญสำหรับ Flutter
          .disableAutoConnect()
          .build(),
    );

    _socket?.connect();

    _socket?.onConnect((_) {
      print('🔌 Socket connected');
      // ✅ เข้าร่วมห้องแชท
      _socket?.emit('joinRoom', roomId);
    });

    // ✅ ฟัง event จาก server (new message)
    _socket?.on('messageFromServer', (data) {
      if (data is Map<String, dynamic>) {
        onMessageReceived(data);
      } else if (data is String) {
        onMessageReceived(jsonDecode(data));
      }
    });

    _socket?.onDisconnect((_) {
      print('Socket disconnected');
    });
  }

  /// ✅ ปิด socket เมื่อไม่ใช้งาน (เช่น ออกจากหน้าแชท)
  void disconnectSocket() {
    _socket?.disconnect();
    _socket = null;
  }
}
