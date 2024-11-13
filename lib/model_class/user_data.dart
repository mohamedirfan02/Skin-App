class UserData {
  final String email;
  final String password;
  final String? userName;
  final String? userProfile;
  final int userId;

  UserData(
      {
        required this.email,
        required this.password,
        required this.userId,
        this.userProfile,
        this.userName,
      });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['organization_name'] ?? '',
      password: json['password'] ?? '',
      userName: json['name'] ?? '',
      userProfile: json['profile'] ?? '',
      userId: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'organization_name': email,
      'password': password,
      'id': userId,
      'profile': userProfile,
      'name': userName
    };
  }
}