import 'package:flutter/material.dart';
import 'package:skin_app/custom_widgets/custom_button.dart';
import 'package:skin_app/custom_widgets/password_textformfield.dart';
import 'package:skin_app/shared/extensions.dart';
import 'package:skin_app/views/home_view.dart';
import 'package:skin_app/views/resetpass.dart';
import 'package:skin_app/views/signupview.dart';
import '../custom_widgets/custom_textformfield.dart';
import '../custom_widgets/forgotPassword_text_button.dart';
import '../custom_widgets/signup_signin_textbutton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',height: 170,width:190),
               SizedBox(height: 2),
               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                ),
              ),
               SizedBox(height: 15),
              CustomTextFormField(
                hintText: 'abc@gmail.com',
                iconData: Icons.mail_outline_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                      .hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
               SizedBox(height: 18),
               CustomPasswordField(
                controller: null,
                hintText: 'Your Password',
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 180.0),
                child: CustomForgotPasswordButton(
                  text: 'Forgot Password?',
                  onPressed: () {
                    context.goto(() => const ResetPasswordScreen());
                  },
                ),
              ),
              CustomButton(buttonText: 'Sign IN',onPressed: (){
                context.goto(() => const HomeScreen());
              },),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text('OR',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              SignUpTextButton(
                onSignUpPressed: () {
                  context.goto(() => const SignUpScreen());
                },
                promptText: 'Don`t have an account?',
                buttontext: 'Sign up', ),
            ],
          ),
        ),
      ),
    );
  }
}
