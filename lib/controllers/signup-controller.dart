// ignore_for_file: unused_field, body_might_complete_normally_nullable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gadgetgallore/models/user-model.dart';
import 'package:gadgetgallore/utils/app-constant.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // for password visibility

  var isPasswordVisible = false.obs;

  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userPassword,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: "Plase Wait");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);

      // send email verifiaction
      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userDeviceToken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now());

      // add data into database
      _firestore
          .collection('user')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
          EasyLoading.dismiss();
          return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appScondaryColor,
          colorText: AppConstant.appTextColor);
    }
  }
}
