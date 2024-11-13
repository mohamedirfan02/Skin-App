import 'package:flutter/material.dart';
import 'package:skin_app/shared/extensions.dart';
import 'package:skin_app/views/home_view.dart';
import '../custom_widgets/conform_pass_textformfield.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_paratext_widget.dart';
import '../custom_widgets/forgotPassword_text_button.dart';
import '../custom_widgets/password_textformfield.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _customPasswordFieldController = TextEditingController();
  final TextEditingController _confirmPasswordFieldController = TextEditingController();
  String? _message;

  void _resetPassword() {
    if (_customPasswordFieldController.text.length < 8 ||
        _confirmPasswordFieldController.text.length < 8) {
      setState(() {
        _message = 'Passwords must be at least 8 characters long.'; // Length error message
      });
      return;
    }

    if (_customPasswordFieldController.text == _confirmPasswordFieldController.text) {
      setState(() {
        _message = 'Password confirmed'; // Show confirmation message
      });
    } else {
      setState(() {
        _message = 'Passwords do not match.'; // Show error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: const CustomText(
                  boldText: 'Create new password',
                  text: 'Your new password must be different\nfrom previous password'),
              ),
              const SizedBox(height: 20),
              CustomPasswordField(
                hintText: 'New Password',
                controller: _customPasswordFieldController,
              ),
              const SizedBox(height: 20),
              ConfirmPasswordField(
                hintText: 'Confirm Password',
                controller: _confirmPasswordFieldController,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: (){
                  context.goto(() => const HomeScreen());
                }, // Use the reset method
                buttonText: 'Reset Password',
              ),
              const SizedBox(height: 20),
              if (_message != null) // Display message if it exists
                Text(
                  _message!,
                  style: TextStyle(
                    fontSize: 18,
                    color: _message == 'Password confirmed' ? Colors.green : Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
