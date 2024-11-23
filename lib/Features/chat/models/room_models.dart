class ChatRoom {
  final String id;
  final List members;
  final String createdAt;
  final String lastMessage;
  final String lastMessageTime;

  ChatRoom({
    required this.lastMessageTime,
    required this.members,
    required this.lastMessage,
    required this.id,
    required this.createdAt,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'] ?? "",
      createdAt: json['created_at'],
      members: json['members'] ?? [],
      lastMessage: json['last_message'] ?? "",
      lastMessageTime: json['last_message_time'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'members': members,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
    };
  }
}
