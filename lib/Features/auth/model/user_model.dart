class UserModel {
  final String name;
  final String id;
  final String email;
  final String createdAt;
  final String lastActivated;
  final String pushToken;
  final String about;
  final bool online;
  final String image;

  UserModel({
    required this.name,
    required this.id,
    required this.email,
    required this.createdAt,
    required this.lastActivated,
    required this.pushToken,
    required this.about,
    required this.online,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      id: json['id'],
      email: json['email'],
      createdAt: json['created_at'],
      lastActivated: json['last_activated'],
      pushToken: json['push_token'],
      about: json['about'],
      online: json['online'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'created_at': createdAt,
      'last_activated': lastActivated,
      'push_token': pushToken,
      'about': about,
      'online': online,
    };
  }
}
