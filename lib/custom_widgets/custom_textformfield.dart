import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final IconData? iconData;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    required this.iconData,
     this.validator,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;
  bool isHintVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    // Listen to changes in the text field to hide/show the hint text
    _controller.addListener(() {
      setState(() {
        isHintVisible = _controller.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 0.4, // Border thickness
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                widget.iconData, // Custom icon passed
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: _controller,
                keyboardType: widget.keyboardType,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  hintText: isHintVisible ? widget.hintText : null,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                validator: widget.validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
