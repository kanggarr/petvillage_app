import 'package:flutter/material.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/services/chat_service.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class ChatRoomViewModel extends BaseViewModel {
  final _chatService = locator<ChatService>();
  final _authService = locator<AuthService>();

  final TextEditingController messageController = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  void setRoomId(String roomId) {
    _authService.setRoomId(roomId); // <-- เพิ่มบรรทัดนี้
  }

  void init() async {
    await fetchMessages();
    _chatService.connectSocket(onMessageReceived);
  }

  Future<void> fetchMessages() async {
    setBusy(true);
    try {
      final fetchedMessages = await _chatService.fetchMessages();
      messages = fetchedMessages.map((msg) {
        final senderId = msg['sender'];
        final isUser = senderId == _authService.getUserId();
        return {
          'type': isUser ? 'user' : 'store',
          'text': msg['content'],
        };
      }).toList();
      setBusy(false);
      notifyListeners();
    } catch (e) {
      setBusy(false);
      debugPrint('❌ Fetch messages error: $e');
    }
  }

  void onMessageReceived(Map<String, dynamic> data) {
    final isUser = data['senderId'] == _authService.getUserId();
    messages.add({
      'type': isUser ? 'user' : 'store',
      'text': data['content'],
    });
    notifyListeners();
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    try {
      await _chatService.sendMessage(text);
      messageController.clear();
    } catch (e) {
      debugPrint('❌ Send message error: $e');
    }
  }

  @override
  void dispose() {
    _chatService.disconnectSocket();
    messageController.dispose();
    super.dispose();
  }
}
