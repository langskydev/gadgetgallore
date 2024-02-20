// ignore_for_file: file_names, unused_local_variable, prefer_const_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gadgetgallore/controllers/get-user-data-controller.dart';
import 'package:gadgetgallore/screens/admin-panel/admin-main-screen.dart';
import 'package:gadgetgallore/screens/auth-ui/welcome-screen.dart';
import 'package:gadgetgallore/screens/user-panel/main-screen.dart';
import 'package:gadgetgallore/utils/app-constant.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () { 
      loggdin(context);
    });
  }

  Future<void> loggdin(BuildContext context) async {
    if(user !=null){
       final GetUserDataController getUserDataController = Get.put(GetUserDataController());
       var userData= await getUserDataController.getUserData(user!.uid);

       if (userData.isNotEmpty && userData[0]['isAdmin'] == true){
        Get.offAll(()=> AdminMainScreen());
       }else{
        Get.offAll(() => MainScreen());
       }
    } else {
      Get.to(() => WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appScondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appScondaryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/splash-icon3.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(color: AppConstant.appTextColor,
                fontSize: 12.0,
                fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
