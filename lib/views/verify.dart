import 'package:flutter/material.dart';
import 'package:skin_app/shared/extensions.dart';
import 'package:skin_app/views/home_view.dart';
import 'package:skin_app/views/resetpass.dart';
import 'dart:async';
import '../custom_widgets/custom_elevatedbutton.dart';
import 'new_password_view.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  int countdown = 20;
  Timer? timer;
  bool _resendEnabled = false;


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              context.goto(() => const ResetPasswordScreen());
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width*0.04,right: width*0.0,top: height*0.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width*0.01,right: width*0.6,top: height*0.02),
              child: Text("Verification",textAlign: TextAlign.start, style: TextStyle(fontSize: 20,fontFamily: "Inter",fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(left: width*0.04,right: width*0.1,top: height*0.02),
              child: Text(
                "We've sent you the verification code on abc@email.com",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16,fontFamily: "Inter",fontWeight: FontWeight.normal)),
              ),
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCodeField(controller1),
                buildCodeField(controller2),
                buildCodeField(controller3),
                buildCodeField(controller4),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width*0.04,right: width*0.04,top: height*0.04),
              child: CustomElevatedButton(text: "Continue", onPressed: (){
                context.goto(() => const NewPassword());
              }),
            ),
            Padding(
              padding: EdgeInsets.only(top: height*0.1),
              child: Text(
                countdown > 0
                    ? "Re-send code in 0:$countdown"
                    : "Resend Code",
                style: TextStyle(
                  color: _resendEnabled ? Colors.redAccent: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeField(TextEditingController controller) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            // context.goto(() => const NewPassword());// Move focus to the next field
          }
        },
      ),
    );
  }
}
