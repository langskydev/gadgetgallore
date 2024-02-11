// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:gadgetgallore/controllers/forget-password-controller.dart';
import 'package:gadgetgallore/utils/app-constant.dart';
import 'package:lottie/lottie.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appScondaryColor,
            centerTitle: true,
            title: Text(
              "Forget Password",
              style: TextStyle(color: AppConstant.appTextColor),
            ),
          ),
          body: Container(
            child: Column(
              children: [
                isKeyboardVisible
                    ? Text(
                        "Welcome To My App",
                        style: TextStyle(
                            color: AppConstant.appScondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )
                    : Column(
                        children: [
                          Lottie.asset('assets/images/splash-icon3.json')
                        ],
                      ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      cursorColor: AppConstant.appScondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 55,
                ),
                Material(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                        color: AppConstant.appScondaryColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextButton(
                      child: Text(
                        "Forget",
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                      onPressed: () async {
                        String email = userEmail.text.trim();

                        if (email.isEmpty) {
                          Get.snackbar("Error", "Please enter all details",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScondaryColor,
                              colorText: AppConstant.appTextColor);
                        } else {
                          String email = userEmail.text.trim();
                          forgetPasswordController.ForgetPasswordMethod(email);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 55,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
