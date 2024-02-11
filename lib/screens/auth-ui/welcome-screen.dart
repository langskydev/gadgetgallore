// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gadgetgallore/controllers/google-signin-controller.dart';
import 'package:gadgetgallore/screens/auth-ui/sign-in-screen.dart';
import 'package:gadgetgallore/utils/app-constant.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController = Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appScondaryColor,
        title: Text(
          "Welcome To My App",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset('assets/images/splash-icon3.json'),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.0),
              child: Text(
                "Happy Shopping",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appScondaryColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextButton.icon(
                  icon: Image.asset(
                    "assets/images/google.png",
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                  label: Text(
                    "Sign in With Google",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  onPressed: () {
                    _googleSignInController.signInWithGoogle();
                  },
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 55,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appScondaryColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.email,
                    color: AppConstant.appTextColor,
                  ),
                  label: Text(
                    "Sign in With Email",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  onPressed: () {
                    Get.to(() => SignIn());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
