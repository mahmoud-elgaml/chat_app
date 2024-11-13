import 'dart:developer';import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talkio_app/Features/profile/reset_password.dart';
import 'package:talkio_app/Features/auth/widgets/custom_button.dart';
import 'package:talkio_app/Features/auth/widgets/custom_text_field.dart';
import 'package:talkio_app/utils/colors.dart';
import 'package:talkio_app/widgets/logo_app.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                const LogoApp(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Chat App With Mahmoud Tarek',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Password',
                  prefixIcon: Icons.lock_outline,
                  controller: passwordController,
                  isPass: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomButton(
                  padding: const EdgeInsets.all(16),
                  text: 'LOGIN',
                  color: kPrimaryColor,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          )
                          .then(
                            (value) => log('Login Done'),
                          )
                          .onError(
                            (error, stackTrace) => Fluttertoast.showToast(
                              msg: error.toString(),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomButton2(
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        )
                        .then(
                          (value) => log('Done'),
                        )
                        .onError(
                          (error, stackTrace) => Fluttertoast.showToast(
                            msg: error.toString(),
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          ),
                        );
                  },
                  text: 'CREATE ACCOUNT',
                  padding: const EdgeInsets.all(16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userRegister =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("User registered: ${userRegister.user?.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userLogin =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("User signed in: ${userLogin.user?.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }
}
