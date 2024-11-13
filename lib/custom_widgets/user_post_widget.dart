import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skin_app/custom_widgets/comment_text_formfield.dart';

import 'comments_view_widget.dart';

class CustomPostItem extends StatefulWidget {
  final String profileImage;
  final String fullName;
  final String postDate;
  final String postText;
  final String postImage;
  final int likes;
  final int comments;
  final int shares;
  final bool isLiked;
  final VoidCallback onLikePressed;

  const CustomPostItem({
    super.key,
    required this.profileImage,
    required this.fullName,
    required this.postDate,
    required this.postText,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.isLiked,
    required this.onLikePressed,
  });

  @override
  _CustomPostItemState createState() => _CustomPostItemState();
}

class _CustomPostItemState extends State<CustomPostItem> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenwidth,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(widget.profileImage),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.fullName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    widget.postDate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: showMore ? widget.postText : widget.postText.substring(0, widget.postText.length > 100 ? 100 : widget.postText.length),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              children: [
                if (widget.postText.length > 100)
                  TextSpan(
                    text: showMore ? ' Show Less' : '... See More',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          showMore = !showMore;
                        });
                      },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Stack(
            children: [
              Image.asset(widget.postImage),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.likes} Likes',
                style: const TextStyle(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {
                  // Show the bottom sheet for comments
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CommentViewScreen(); // Display the CommentScreen inside the BottomSheet
                    },
                  );
                },
                child: Text(
                  '${widget.comments > 99 ? '99+' : widget.comments} Comments',
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Text(
                '${widget.shares} Shares',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: Icon(
                  widget.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: widget.isLiked ? Colors.red : Colors.grey,
                ),
                label: const Text(
                  'Like',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: widget.onLikePressed,
              ),
              TextButton.icon(
                icon: const Icon(Icons.mode_comment_outlined, color: Colors.grey),
                label: const Text(
                  'Comment',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  // Show the bottom sheet for comments
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CommentTextField(); // Display the CommentScreen inside the BottomSheet
                    },
                  );
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.ios_share_outlined, color: Colors.grey),
                label: const Text(
                  'Share',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () async {
                  final urlPreview = 'https://ibb.co/3zqS6KT';
                  await Share.share('Post of the Day\n\n$urlPreview');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}