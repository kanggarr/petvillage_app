import 'package:flutter/material.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/services/chat_messages_service.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:petvillage_app/models/message_model.dart';
import 'package:stacked/stacked.dart';

class ChatRoomViewModel extends BaseViewModel {
  final _chatService = locator<ChatMessagesService>();
  final _authService = locator<AuthService>();

  final TextEditingController messageController = TextEditingController();
  List<Message> messages = [];

  /// Initialize: load historic messages and open socket
  Future<void> init() async {
    setBusy(true);
    await _loadMessages();
    _chatService.connectSocket(_onMessageReceived);
    setBusy(false);
  }

  Future<void> _loadMessages() async {
    try {
      final raw = await _chatService.fetchMessages();
      messages = raw.map((json) => Message.fromJson(json)).toList();
    } catch (e) {
      debugPrint('❌ Fetch messages error: $e');
      messages = [];
    }
  }

  void _onMessageReceived(Map<String, dynamic> data) {
    final msg = Message.fromJson(data);
    messages.add(msg);
    notifyListeners();
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    print('Sending message: $text');
    print('Room ID: ${_authService.getRoomId()}');
    print('User ID: ${_authService.getUserId()}');

    try {
      final raw = await _chatService.sendMessage(text);
      final sent = Message.fromJson(raw);
      messages.add(sent);
      messageController.clear();
      notifyListeners();
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
