import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String boldText;
  final String text;

  const CustomText({super.key,
    required this.boldText,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        // "Reset Password" text in bold and Inter font
        Text(
          boldText,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter', // Use Inter font
            color: Colors.black87, // Customize as needed
          ),
        ),
        SizedBox(height: 8), // Spacing between the two texts
        // Instructional text in normal weight
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'Inter', // Use Inter font
            color: Colors.black54, // Customize as needed
          ),
        ),
      ],
    );
  }
}
