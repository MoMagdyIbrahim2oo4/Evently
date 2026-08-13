class AppUser {
  static const String collectionName = 'User';
  String id;
  String userName;
  String email;

  AppUser({required this.id, required this.userName, required this.email});

  AppUser.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'] as String,
        email: json['email'] as String,
        userName: json['username'] as String,
      );

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'username': userName};
  }
}
