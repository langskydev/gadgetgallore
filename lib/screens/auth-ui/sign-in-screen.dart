// ignore_for_file: unused_local_variable, unnecessary_null_comparison, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:gadgetgallore/controllers/get-user-data-controller.dart';
import 'package:gadgetgallore/controllers/signin-controller.dart';
import 'package:gadgetgallore/screens/admin-panel/admin-main-screen.dart';
import 'package:gadgetgallore/screens/auth-ui/forget-password-screen.dart';
import 'package:gadgetgallore/screens/auth-ui/sign-up-screen.dart';
import 'package:gadgetgallore/screens/user-panel/main-screen.dart';
import 'package:gadgetgallore/utils/app-constant.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appScondaryColor,
            centerTitle: true,
            title: Text(
              "Sign In",
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                        () => TextFormField(
                          controller: userPassword,
                          obscureText: signInController.isPasswordVisible.value,
                          cursorColor: AppConstant.appScondaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 2.0),
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  signInController.isPasswordVisible.toggle();
                                },
                                child: signInController.isPasswordVisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 11.0),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ForgetPassword());
                    },
                    child: Text(
                      "Forget Password",
                      style: TextStyle(
                          color: AppConstant.appScondaryColor,
                          fontWeight: FontWeight.bold),
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
                        "SigIn",
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                      onPressed: () async {
                        String email = userEmail.text.trim();
                        String password = userPassword.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          Get.snackbar("Error", "Please enter all details",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScondaryColor,
                              colorText: AppConstant.appTextColor);
                        } else {
                          UserCredential? userCredential =
                              await signInController.signInMethod(
                                  email, password);

                          var userData = await getUserDataController
                              .getUserData(userCredential!.user!.uid);

                          if (userCredential != null) {
                            if (userCredential.user!.emailVerified) {
                              //
                               if (userData[0]['isAdmin'] == true)  {
                                Get.snackbar(
                                    "Success Admin Login", "Login Succesfully!",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        AppConstant.appScondaryColor,
                                    colorText: AppConstant.appTextColor);
                                Get.offAll(() => AdminMainScreen());
                              } else {
                                Get.offAll(() => MainScreen());
                                Get.snackbar(
                                    "Success User Login", "Login Succesfully!",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        AppConstant.appScondaryColor,
                                    colorText: AppConstant.appTextColor);
                              }
                            } else {
                              Get.snackbar("Error",
                                  "Please verify your email before login",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appScondaryColor,
                                  colorText: AppConstant.appTextColor);
                            }
                          } else {
                            Get.snackbar("Error", "Please try again",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScondaryColor,
                                colorText: AppConstant.appTextColor);
                          }
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: AppConstant.appScondaryColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SignUp()),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppConstant.appScondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
