import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/views/message/message_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:petvillage_app/models/chat_room_model.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
      viewModelBuilder: () => MessageViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('แชท'),
          centerTitle: true,
        ),
        body: model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : model.rooms.isEmpty
                ? const Center(child: Text('ไม่มีห้องแชท'))
                : ListView.builder(
                    itemCount: model.rooms.length,
                    itemBuilder: (context, index) {
                      final room = model.rooms[index];
                      return ChatRoomTile(room: room, model: model);
                    },
                  ),
      ),
    );
  }
}

class ChatRoomTile extends StatelessWidget {
  final ChatRoom room;
  final MessageViewModel model;

  const ChatRoomTile({Key? key, required this.room, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // แสดงชื่อของคู่สนทนา (shop ถ้าเป็น user, user ถ้าเป็น shop)
    final displayName = model.userRole == 'shop'
        ? (room.userId.isNotEmpty ? room.userId : 'ผู้ใช้')
        : (room.shopId.isNotEmpty ? room.shopId : 'ร้านค้า');
    return ListTile(
      title: Text(
        room.roomName.isNotEmpty ? room.roomName : displayName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        room.roomName.isNotEmpty ? room.roomName : displayName,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatTime(room.updatedAt),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          if (room.unreadCount != null && room.unreadCount! > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Text(
                '${room.unreadCount}',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () => model.navigateToChatRoom(room),
    );
  }

  String _formatTime(DateTime? time) {
    if (time == null) return '';
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDay = DateTime(time.year, time.month, time.day);

    if (today == messageDay) {
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    } else if (today.difference(messageDay).inDays == 1) {
      return 'เมื่อวาน';
    } else {
      return '${time.day}/${time.month}/${time.year}';
    }
  }
}
