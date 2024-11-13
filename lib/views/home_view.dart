import 'package:flutter/material.dart';
import 'package:skin_app/shared/extensions.dart';
import 'package:skin_app/views/profile_view.dart';
import '../custom_widgets/home_profile_widget.dart';
import '../custom_widgets/user_post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _likes = 0;
   int _shares = 0;
  List<Map<String, dynamic>> dummyPosts = [
    {
      "profileImage": 'assets/images/postprofile.png',
      "fullName": "John Doe",
      "postDate": "Mon 10 Oct, 3pm",
      "postText":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "postImage": 'assets/images/post.png',
      "likes": 1500,
      "comments": 3,
      "shares": 10,
      "isLiked": false,
    },
    {
      "profileImage": 'assets/images/postprofile2.png',
      "fullName": "Jane Smith",
      "postDate": "Wed 12 Oct, 5pm",
      "postText":
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "postImage": 'assets/images/post.png',
      "likes": 200,
      "comments": 3,
      "shares": 8,
      "isLiked": false,
    },
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.goto(() =>  const ProfileScreen());
                      },
                      child: const Heading(
                        imagePath: "assets/images/profile",
                        text1: 'Hello,',
                        text2: 'Kate Norman',
                      ),
                    ),
                    const SizedBox(
                      width: 115,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Divider(),
                ListView.builder(
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dummyPosts.length,
                  itemBuilder: (BuildContext,int index) {
                    final post = dummyPosts[index];
                    return CustomPostItem(
                      profileImage: post['profileImage'],
                      fullName: post['fullName'],
                      postDate: post['postDate'],
                      postText: post['postText'],
                      postImage: post['postImage'],
                      likes: post['likes'],
                      comments: post['comments'],
                      shares: post['shares'],
                      isLiked: post['isLiked'],
                      onLikePressed: () {
                        setState(() {
                          dummyPosts[index]['isLiked'] =
                              !dummyPosts[index]['isLiked'];
                        });
                      },
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
