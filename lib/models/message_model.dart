class MessageModel {
  final String shopId;
  final String shopName;
  final String lastMessage;
  final String time;

  MessageModel({
    required this.shopId,
    required this.shopName,
    required this.lastMessage,
    required this.time,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final timestamp = DateTime.parse(json['timestamp']);
    final formattedTime = formatTime(timestamp);

    return MessageModel(
      shopId:
          json['sender'].startsWith('shop') ? json['sender'] : 'shop_unknown',
      shopName: getShopName(json['sender']),
      lastMessage: json['content'],
      time: formattedTime,
    );
  }

  static String getShopName(String senderId) {
    // 🔧 ปรับตามความเหมาะสม ถ้าไม่มีระบบเก็บชื่อร้าน
    if (senderId.startsWith('shop')) {
      return 'ร้าน ${senderId.substring(4)}';
    }
    return 'ไม่ทราบชื่อร้าน';
  }

  static String formatTime(DateTime timestamp) {
    final now = DateTime.now();
    if (now.difference(timestamp).inDays == 0) {
      return 'วันนี้ ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    }
    return '${timestamp.day}/${timestamp.month}/${timestamp.year + 543}'; // วันที่แบบ พ.ศ.
  }
}
