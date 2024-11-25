class MessageModel {
  final String message;
  final String id;
  final String toId;
  final String fromId;
  final String type;
  final String createdAt;
  final String read;

  MessageModel({
    required this.message,
    required this.id,
    required this.type,
    required this.createdAt,
    required this.read,
    required this.fromId,
    required this.toId,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      id: json['id'],
      type: json['type'],
      createdAt: json['created_at'],
      read: json['last_activated'],
      toId: json['to_id'],
      fromId: json['from_id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'id': id,
      'to_id': toId,
      'from_id': fromId,
      'type': type,
      'created_at': createdAt,
      'last_activated': read,
    };
  }
}
