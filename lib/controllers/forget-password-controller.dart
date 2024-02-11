// ignore_for_file: unused_field, body_might_complete_normally_nullable, unused_local_variable, non_constant_identifier_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gadgetgallore/screens/auth-ui/sign-in-screen.dart';
import 'package:gadgetgallore/utils/app-constant.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> ForgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: "Plase Wait");

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar("Request send success", "Password reesr link sent to $userEmail",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appScondaryColor,
          colorText: AppConstant.appTextColor);

          Get.offAll(()=> SignIn());

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appScondaryColor,
          colorText: AppConstant.appTextColor);
    }
  }
}
