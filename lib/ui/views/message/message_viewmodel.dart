// import 'dart:developer';

// import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:petvillage_app/models/message_model.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:petvillage_app/services/message_service.dart';
import 'package:petvillage_app/services/auth_service.dart';

class MessageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _messageService = locator<MessageService>();
  final _authService = locator<AuthService>();

  List<MessageModel> messageList = [];

  String get userRole => _authService.getUserRole();

  Future<void> init() async {
    setBusy(true);
    final userId = _authService.getUserId(); // ✅ userId ต้องมีจาก login

    final userRole = _authService.getUserRole();
    if (userRole == 'user') {
      messageList = await _messageService.fetchUserMessages(userId);
    } else {
      messageList = await _messageService.fetchShopMessages(userId);
    }
    setBusy(false);
    notifyListeners();
  }

  void navigateToChat(String roomId, String shopName) {
    // set roomId to authService
    _authService.setRoomId(roomId);
    print("✅✅ roomId by navigateToChat : ${_authService.getRoomId()}");
    _navigationService.navigateTo(
      Routes.chatRoomView,
      arguments: {'roomId': roomId, 'shopName': shopName},
    );
  }
}
