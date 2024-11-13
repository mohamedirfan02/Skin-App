import 'package:skin_app/shared/extensions.dart';

class CommentData {

  final String profileImage;
  final String username;
  final String timeAgo;
  final String comment;
  final int likes;
  final String hasReplies;

  CommentData({
    required this.profileImage,
    required this.username,
    required this.timeAgo,
    required this.comment,
    required this.likes,
    required this.hasReplies,
  });
  CommentData.fromJson(Map<String, dynamic> json)
      : this(
    profileImage: json.hasProp('profileImage') ? json['profileImage'] as String : "",
    username: json.hasProp('username') ? json['username'] as String : "",
    timeAgo: json.hasProp('timeAgo') ? json['timeAgo'] as String : "",
    comment: json.hasProp('comment') ? json['comment'] as String : "",
    likes: json.hasProp('likes') ? json['likes'] as int : 0,
    hasReplies: json.hasProp('hasReplies') ? json['hasReplies'] as String : "",

  );

  // Method to convert Post to JSON
  Map<String, dynamic> toJson() => {
    'profileImage': profileImage,
    'username': username,
    'timeAgo': timeAgo,
    'likes': likes,
    'comment': comment,
    'hasReplies': hasReplies,
  };
}
