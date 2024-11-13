import 'package:flutter/material.dart';
import 'package:skin_app/shared/extensions.dart';

class CommentViewScreen extends StatelessWidget {
  final String? hintText;
  final Function()? onSendPressed;

  // Dummy comment data
  final List<Map<String, String>> comments = [
    {
      'name': 'Maude Hall',
      'time': '14 min',
      'comment': "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback.",
      'imageUrl': 'https://ibb.co/BBKnkdt',
    },
    {
      'name': 'Dianne Russell',
      'time': '24 min',
      'comment': "But don't you think the timing is off because many other apps have done this even earlier, causing people to switch apps?",
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Esther Howard',
      'time': '26 min',
      'comment': "This could be due to them taking their time to release a stable version.",
      'imageUrl': 'https://via.placeholder.com/150',
    },
  ];

  CommentViewScreen({super.key, this.hintText, this.onSendPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Comment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Divider(),
          // Comment section
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(comment['imageUrl']!),
                          radius: 20,
                        ),
                        title: Text(
                          comment['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          comment['time']!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(comment['comment']!),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('2 Likes'),
                            ),
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Reply'),
                            ),
                          ],
                        ),
                      ),
                      if (index == 1)
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                          //   leading: CircleAvatar(
                          //     backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                          //     radius: 20,
                          //   ),
                          //   title: Text(
                          //     'Esther Howard',
                          //     style: const TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          //   subtitle: const Text(
                          //     '26 min',
                          //     style: TextStyle(color: Colors.grey),
                          //   ),
                            trailing: IconButton(
                              icon: const Icon(Icons.thumb_up, color: Colors.grey),
                              onPressed: () {},
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Comment input field
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: TextField(
          //           decoration: InputDecoration(
          //             hintText: hintText ?? 'Type your comment here...',
          //             contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(25.0),
          //             ),
          //           ),
          //         ),
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.send, color: Colors.blue),
          //         onPressed: onSendPressed,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
