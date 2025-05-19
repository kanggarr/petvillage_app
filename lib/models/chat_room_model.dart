import 'package:petvillage_app/models/message_model.dart';

class ChatRoom {
  final String id;
  final String roomName;
  final String userId;
  final String shopId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? unreadCount;

  ChatRoom({
    required this.id,
    required this.roomName,
    required this.userId,
    required this.shopId,
    required this.createdAt,
    required this.updatedAt,
    this.unreadCount,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    String parseId(dynamic field) {
      if (field == null) return '';
      if (field is String) return field;
      if (field is Map<String, dynamic> && field['_id'] is String) {
        return field['_id'] as String;
      }
      return '';
    }

    Message? parseLastMessage(dynamic lastMsg) {
      if (lastMsg == null) return null;
      if (lastMsg is Map<String, dynamic>) {
        return Message.fromJson(lastMsg);
      }
      if (lastMsg is String) {
        return Message.fromJson({'_id': lastMsg, 'content': ''});
      }
      return null;
    }

    DateTime parseDate(dynamic date) {
      if (date == null) return DateTime.now();
      if (date is String) {
        try {
          return DateTime.parse(date);
        } catch (_) {
          return DateTime.now();
        }
      }
      return DateTime.now();
    }

    return ChatRoom(
      id: json['_id']?.toString() ?? json['id']?.toString() ?? '',
      roomName: json['roomName']?.toString() ?? '',
      userId: parseId(json['user']),
      shopId: parseId(json['shop']),
      createdAt: parseDate(json['createdAt']),
      updatedAt: parseDate(json['updatedAt']),
      unreadCount: json['unreadCount'] is int ? json['unreadCount'] : null,
    );
  }
}
