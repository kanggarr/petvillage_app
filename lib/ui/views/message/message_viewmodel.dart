import 'package:stacked/stacked.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:petvillage_app/services/chat_room_service.dart';
import 'package:petvillage_app/models/chat_room_model.dart';

class MessageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _chatRoomService = locator<ChatRoomService>();
  final _authService = locator<AuthService>();

  List<ChatRoom> rooms = [];

  String get userRole => _authService.getUserRole();
  String get userId => _authService.getUserId();

  Future<void> init() async {
    setBusy(true);
    rooms = await _chatRoomService.getUserRooms();
    if (rooms.isEmpty) {
      rooms = [];
    }

    setBusy(false);
  }

  void navigateToChatRoom(ChatRoom room) {
    _authService.setRoomId(room.id);
    _navigationService.navigateTo(
      Routes.chatRoomView,
      arguments: {
        'roomId': room.id,
        'shopName': room.shopId == userId ? room.userId : room.shopId,
        'roomName': room.roomName,
      },
    );
  }
}
