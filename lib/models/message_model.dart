class Message {
  final String id;
  final String roomId;
  final String senderId;
  final String senderType;
  final String content;
  final DateTime timestamp;
  final List<dynamic> readBy;
  final List<dynamic> attachments;

  Message({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.senderType,
    required this.content,
    required this.timestamp,
    this.readBy = const [],
    this.attachments = const [],
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    // Extract senderId safely from nested sender object or use empty string if null
    String extractSenderId(dynamic sender) {
      if (sender == null) return '';
      if (sender is Map<String, dynamic>) {
        final id = sender['_id'] ?? sender['id'];
        if (id is String) return id;
        // Sometimes the id can be some other type (e.g., ObjectId), convert to string
        return id.toString();
      }
      // fallback if sender is already a string
      if (sender is String) return sender;
      return '';
    }

    // Parse timestamp safely
    DateTime parseTimestamp(dynamic ts) {
      if (ts == null) return DateTime.now();
      if (ts is String) {
        try {
          return DateTime.parse(ts);
        } catch (_) {
          return DateTime.now();
        }
      }
      if (ts is DateTime) return ts;
      return DateTime.now();
    }

    return Message(
      id: json['_id']?.toString() ?? '',
      roomId: json['roomId']?.toString() ?? '',
      senderId: extractSenderId(json['sender']),
      senderType: json['senderType']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      timestamp: parseTimestamp(json['timestamp']),
      readBy: (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'roomId': roomId,
        'sender': senderId,
        'senderType': senderType,
        'content': content,
        'timestamp': timestamp.toIso8601String(),
        'readBy': readBy.map((r) => r.toJson()).toList(),
        'attachments': attachments.map((a) => a.toJson()).toList(),
      };
}
