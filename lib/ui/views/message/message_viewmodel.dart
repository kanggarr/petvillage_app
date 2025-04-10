import 'package:stacked/stacked.dart';
import 'package:petvillage_app/models/message_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';

class MessageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<MessageModel> messageList = [
    MessageModel(
      shopId: '1',
      shopName: 'Pets store01',
      lastMessage: 'message...',
      time: 'วันนี้ 00:01',
    ),
    MessageModel(
      shopId: '2',
      shopName: 'Pets shop',
      lastMessage: 'message...',
      time: '11 ธ.ค. 2567',
    ),
  ];

  void navigateToChat(String shopId) {
    _navigationService
        .navigateTo(Routes.chatView, arguments: {'shopId': shopId});
  }
}
