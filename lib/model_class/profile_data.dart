class ProfileData {

  int? userId;
  String? profile;
  String? userName;
  String? email;

  ProfileData({
    required this.userId,
    required this.profile,
    required this.userName,
    this. email,

  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      userId: json['id_number'] ?? 0,
      profile: json['profile'] ?? '',
      userName: json['name'] ?? '',
      email: json['emailId'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_number': userId,
      'profile': profile,
      'name': userName,
      'emailId': email,
    };
  }
}