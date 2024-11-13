import 'package:flutter/material.dart';
import 'package:skin_app/shared/extensions.dart';
import 'package:skin_app/views/home_view.dart';
import 'package:skin_app/views/signin_view.dart';
import '../custom_widgets/custom_elevatedbutton.dart';
import '../custom_widgets/custom_textformfield.dart';
import '../custom_widgets/customtextformfield.dart';
import '../custom_widgets/password_textformfield.dart';
import '../custom_widgets/signup_signin_textbutton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.goto(() => const SignInScreen());
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Sign up", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10,),
              CustomTextFormField(
                hintText: 'Full name',
                iconData: Icons.person_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'abc@gmail.com',
                iconData: Icons.mail_outline_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                      .hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15,),
              const CustomPasswordField(hintText: 'Your password'),
              const SizedBox(height: 15,),
              const CustomPasswordField(hintText: 'Confirm password'),
              const SizedBox(height: 23,),
              CustomElevatedButton(
                  text: "Sign UP",
                  onPressed: () {
                    context.goto(() => const HomeScreen());
                  }),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Text("OR", style: TextStyle(fontSize: 13,color: Colors.pinkAccent,fontWeight: FontWeight.bold)),
              ),
              SignUpTextButton(
                onSignUpPressed: () {
                  context.goto(() => const SignInScreen());
                },
                promptText: 'Already have an account?',
                buttontext: 'Sign in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
