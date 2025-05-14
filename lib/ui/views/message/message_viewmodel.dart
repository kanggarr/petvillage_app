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

  Future<void> init() async {
    setBusy(true);
    final userId = _authService.getUserId(); // ✅ userId ต้องมีจาก login
    messageList = await _messageService.fetchLatestMessages(userId);
    setBusy(false);
    notifyListeners();
  }

  void navigateToChat(String shopId) {
    _navigationService
        .navigateTo(Routes.chatView, arguments: {'shopId': shopId});
  }
}
