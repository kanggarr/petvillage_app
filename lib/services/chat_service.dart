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
    // final roomId = _authService.getRoomId();
    // final url = Uri.parse(
    //   Platform.isAndroid
    //       ? '${dotenv.env['API_ANDROID_URL']}api/messages/$roomId'
    //       : '${dotenv.env['API_IOS_URL']}api/messages/$roomId',
    // );

    // try {
    //   final response = await http.get(url);
    //   if (response.statusCode == 200) {
    //     final List<dynamic> messages = jsonDecode(response.body);
    //     return messages.map((msg) => msg as Map<String, dynamic>).toList();
    //   } else {
    //     throw Exception('ไม่สามารถโหลดข้อความได้');
    //   }
    // } catch (e) {
    //   throw Exception('เกิดข้อผิดพลาดขณะโหลดข้อความ: $e');
    // }
    return [];
  }

  /// ✅ ส่งข้อความใหม่เข้าไปในห้องแชท
  Future<void> sendMessage(String content) async {
    // final senderId = _authService.getUserId();

    // final url = Uri.parse(
    //   Platform.isAndroid
    //       ? '${dotenv.env['API_ANDROID_URL']}api/messages'
    //       : '${dotenv.env['API_IOS_URL']}api/messages',
    // );

    // try {
    //   final response = await http.post(
    //     url,
    //     headers: {'Content-Type': 'application/json'},
    //     body: jsonEncode({
    //       'roomId': roomId,
    //       'senderId': senderId,
    //       'content': content,
    //     }),
    //   );

    //   if (response.statusCode == 201) {
    //     // ✅ ถ้าส่งสำเร็จ ให้ emit ไปยัง socket ด้วย (สำหรับผู้ใช้คนอื่น)
    //     _socket?.emit('newMessage', {
    //       'roomId': roomId,
    //       'senderId': senderId,
    //       'content': content,
    //     });
    //   } else {
    //     final data = jsonDecode(response.body);
    //     throw Exception(data['msg'] ?? 'ส่งข้อความไม่สำเร็จ');
    //   }
    // } catch (e) {
    //   throw Exception('เกิดข้อผิดพลาดในการส่งข้อความ: $e');
    // }
  }

  /// ✅ เริ่มการเชื่อมต่อ socket กับ server
  void connectSocket(Function(Map<String, dynamic>) onMessageReceived) {
    //   final uri = Platform.isAndroid
    //       ? dotenv.env['API_ANDROID_URL']!.replaceFirst('http', 'ws')
    //       : dotenv.env['API_IOS_URL']!.replaceFirst('http', 'ws');

    //   _socket = IO.io(
    //     uri,
    //     IO.OptionBuilder()
    //         .setTransports(['websocket']) // ❗ สำคัญสำหรับ Flutter
    //         .disableAutoConnect()
    //         .build(),
    //   );

    //   _socket?.connect();

    //   _socket?.onConnect((_) {
    //     print('🔌 Socket connected');
    //     // ✅ เข้าร่วมห้องแชท
    //     _socket?.emit('joinRoom', roomId);
    //   });

    //   // ✅ ฟัง event จาก server (new message)
    //   _socket?.on('messageFromServer', (data) {
    //     if (data is Map<String, dynamic>) {
    //       onMessageReceived(data);
    //     } else if (data is String) {
    //       onMessageReceived(jsonDecode(data));
    //     }
    //   });

    //   _socket?.onDisconnect((_) {
    //     print('Socket disconnected');
    //   });
    // }

    // /// ✅ ปิด socket เมื่อไม่ใช้งาน (เช่น ออกจากหน้าแชท)
    // void disconnectSocket() {
    //   _socket?.disconnect();
    //   _socket = null;
  }
}
