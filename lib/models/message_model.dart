class MessageModel {
  final String shopId;
  final String shopName;
  final String time;
  final String profileImage;

  MessageModel({
    required this.shopId,
    required this.shopName,
    required this.time,
    required this.profileImage,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json, String userRole) {
    final shop = json['shop'] as Map<String, dynamic>?;
    final user = json['user'] as Map<String, dynamic>?;

    final timestamp = DateTime.tryParse(json['updatedAt'] ?? '');
    final formattedTime =
        timestamp != null ? formatTime(timestamp) : 'ไม่ทราบเวลา';

    if (userRole == 'shop') {
      // ร้านค้า login → แสดงชื่อ user
      return MessageModel(
        profileImage: user?['profileImage'] ?? '',
        shopId: user?['_id'] ?? 'user_unknown',
        shopName: user?['username'] ?? 'ไม่ทราบชื่อผู้ใช้',
        time: formattedTime,
      );
    } else {
      // ผู้ใช้ login → แสดงชื่อร้านค้า
      return MessageModel(
        profileImage: shop?['profileImage'] ?? '',
        shopId: shop?['_id'] ?? 'shop_unknown',
        shopName: shop?['username'] ?? 'ไม่ทราบชื่อร้าน',
        time: formattedTime,
      );
    }
  }

  static String formatTime(DateTime timestamp) {
    final localTimestamp = timestamp.toUtc().add(const Duration(hours: 7));
    final now = DateTime.now().toUtc().add(const Duration(hours: 7));

    if (now.difference(localTimestamp).inDays == 0) {
      return 'วันนี้ ${localTimestamp.hour.toString().padLeft(2, '0')}:${localTimestamp.minute.toString().padLeft(2, '0')}';
    }

    return '${localTimestamp.day}/${localTimestamp.month}/${localTimestamp.year + 543}';
  }

  /// เช็คว่า image เป็น URL หรือไม่ (เพื่อใช้ NetworkImage)
  bool get hasNetworkImage =>
      profileImage.isNotEmpty &&
      (profileImage.startsWith('http') || profileImage.startsWith('https'));
}
