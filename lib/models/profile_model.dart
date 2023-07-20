class Profile {
  Profile({
    required this.id,
    required this.username,
    required this.email,
    required this.createdAt,
  });

  /// User ID of the profile
  final String id;

  /// Username of the profile
  final String username;

  /// Email of the profile
  final String email;

  /// Date and time when the profile was created
  final DateTime createdAt;

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        email = map['email'],
        createdAt = DateTime.parse(map['created_at']);
}
