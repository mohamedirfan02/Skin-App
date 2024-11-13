import 'package:skin_app/shared/extensions.dart';

class PostData {
  String? postProfile;
  String? postName;
  String? postTime;
  String? postContent;
  String? imageUrl;
  int? likes;
  int? comments;
  int? shares;
  int? userId;

  PostData({
    this.postProfile,
    this.postName,
    this.postTime,
    this.postContent,
    this.imageUrl,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
    this.userId=0,
  });

  // Factory method to create a Post from JSON
  PostData.fromJson(Map<String, dynamic> json)
      : this(
    postProfile: json.hasProp('userProfile') ? json['userProfile'] as String : "",
    postName: json.hasProp('userName') ? json['userName'] as String : "",
    postTime: json.hasProp('postTime') ? json['postTime'] as String : "",
    postContent: json.hasProp('postContent') ? json['postContent'] as String : "",
    imageUrl: json.hasProp('imageUrl') ? json['imageUrl'] as String : "",
    likes: json.hasProp('likes') ? json['likes'] as int : 0,
    comments: json.hasProp('comments') ? json['comments'] as int : 0,
    shares: json.hasProp('shares') ? json['shares'] as int : 0,
    userId: json.hasProp('userId') ? json['userId'] as int : 0,


  );

  // Method to convert Post to JSON
  Map<String, dynamic> toJson() => {
    'userProfile': postProfile,
    'userName': postName,
    'postTime': postTime,
    'postContent': postContent,
    'imageUrl': imageUrl,
    'likes': likes,
    'comments': comments,
    'shares': shares,
    'userId':userId,
  };
}
