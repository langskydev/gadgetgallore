// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:gadgetgallore/controllers/signup-controller.dart';
import 'package:gadgetgallore/screens/auth-ui/sign-in-screen.dart';
import 'package:gadgetgallore/utils/app-constant.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
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
              "Sign Up",
              style: TextStyle(color: AppConstant.appTextColor),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome To My App",
                        style: TextStyle(
                            color: AppConstant.appScondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )),
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
                      child: TextFormField(
                        controller: username,
                        cursorColor: AppConstant.appScondaryColor,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Username",
                          contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
                          prefixIcon: Icon(Icons.person),
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
                      child: TextFormField(
                        controller: userPhone,
                        cursorColor: AppConstant.appScondaryColor,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Phone",
                          contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
                          prefixIcon: Icon(Icons.phone),
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
                          obscureText: signUpController.isPasswordVisible.value,
                          cursorColor: AppConstant.appScondaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 2.0),
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  signUpController.isPasswordVisible.toggle();
                                },
                                child: signUpController.isPasswordVisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
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
                          "SigUp",
                          style: TextStyle(color: AppConstant.appTextColor),
                        ),
                        onPressed: () async {
                          String name = username.text.trim();
                          String email = userEmail.text.trim();
                          String phone = userPhone.text.trim();
                          String password = userPassword.text.trim();
                          String userDeviceToken = '';

                          if (name.isEmpty ||
                              email.isEmpty ||
                              phone.isEmpty ||
                              password.isEmpty) {
                            Get.snackbar(
                              "Error",
                              "Please enter all details",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScondaryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          } else {
                            UserCredential? userCredential =
                                await signUpController.signUpMethod(name, email,
                                    phone, password, userDeviceToken);

                            if (userCredential != null) {
                              Get.snackbar(
                                "Verification email sent",
                                "Please check your email",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScondaryColor,
                                colorText: AppConstant.appTextColor,
                              );

                              FirebaseAuth.instance.signOut();
                              Get.offAll(()=> SignIn());
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
                        "Already have an account?",
                        style: TextStyle(color: AppConstant.appScondaryColor),
                      ),
                      GestureDetector(
                        onTap: () => Get.offAll(() => SignIn()),
                        child: Text(
                          "SignIn",
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
          ),
        );
      },
    );
  }
}
