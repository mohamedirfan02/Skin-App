import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AuthController extends GetX{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();

  var isEmailValied = true.obs;
  var isPasswordValied = true.obs;
  var isConfirmPasswordValied = true.obs;
  AuthController({super.key, required super.builder, });

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    //validating email is not empty and is correct one
    if(email.isEmpty || !email.isEmail) {
      isEmailValied.value = false;
    }
    else{
      isEmailValied.value = true;
    }
    //validating password is not empty and has length greater than or equal to 6
    //characters
    if(password.isEmpty || password.length < 6) {
      isPasswordValied.value = false;
    }
    else{
      isPasswordValied.value = true;
    }
    //validating email and password and static checking
    if(isEmailValied.value &&
        isPasswordValied.value &&
        emailController.text == "sample@gmail.com"){
      Get.snackbar("Success", "Logged In Successfully!",
          colorText: Colors.white,backgroundColor: Colors.green);
    } else{
        Get.snackbar("Error", "Logged In Failed!",
            colorText: Colors.white,backgroundColor: Colors.red);
    }

}

  void signup(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmpasswordController.text.trim();

    //validating email is not empty and is correct one
    if(email.isEmpty || !email.isEmail) {
      isEmailValied.value = false;
    }
    else{
      isEmailValied.value = true;
    }
    //validating password is not empty and has length greater than or equal to 6
    //characters
    if(password.isEmpty || password.length < 6) {
      isPasswordValied.value = false;
    }
    else{
      isPasswordValied.value = true;
    }
    //validating if password and confirmPassword are same
    if(confirmPassword !=password) {
      isConfirmPasswordValied.value = false;
    }
    else{
      isConfirmPasswordValied.value = true;
    }

    //validating email and password and static checking
    if(isEmailValied.value &&
        isPasswordValied.value && isConfirmPasswordValied.value){
      Get.snackbar("Success", "Signed Up Successfully!",
          colorText: Colors.white,backgroundColor: Colors.green);
    } else{
      Get.snackbar("Error", "Signed Up Failed!",
          colorText: Colors.white,backgroundColor: Colors.red);
    }

  }

}