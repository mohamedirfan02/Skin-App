import 'package:flutter/material.dart';
import 'package:skin_app/shared/extensions.dart';
import 'package:skin_app/views/signin_view.dart';
import 'package:skin_app/views/signupview.dart';
import 'package:skin_app/views/verify.dart';
import '../custom_widgets/custom_elevatedbutton.dart';
import '../custom_widgets/custom_textformfield.dart';
import '../custom_widgets/customtextformfield.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              context.goto(() => const SignInScreen());
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft,
                  child: Text("Reset Password", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
              SizedBox(height: 18,),
              Align(alignment: Alignment.centerLeft,
                  child: Text("Please enter your email address\nto request a password reset",style: TextStyle(fontSize: 15),)),
              SizedBox(height: 30,),
             CustomTextFormField(
               hintText: 'Please enter an email',
               iconData: Icons.mail_outline,
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
              SizedBox(height: 35),
              CustomElevatedButton(
                  text: "Send",
                  onPressed: (){
                    context.goto(() => const OtpVerificationScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
