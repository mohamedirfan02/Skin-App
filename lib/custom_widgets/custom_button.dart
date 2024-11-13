import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;

  const CustomButton({
    super.key,
     this.onPressed,
     required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: screenwidth,
        decoration: BoxDecoration(
          color:  Color(0xFFFF9797),
          borderRadius: BorderRadius.circular(30.0),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 8,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        margin: const EdgeInsets.all(3),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontFamily: "Inter",
            ),
          ),
        ),
      ),
    );
  }
}
