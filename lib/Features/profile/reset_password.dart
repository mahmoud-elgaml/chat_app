import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talkio_app/Features/auth/widgets/custom_button.dart';
import 'package:talkio_app/Features/auth/widgets/custom_text_field.dart';
import 'package:talkio_app/utils/colors.dart';
import 'package:talkio_app/widgets/logo_app.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                const LogoApp(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Please enter your email',
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
                const SizedBox(
                  height: 6,
                ),
                CustomButton(
                  padding: const EdgeInsets.all(16),
                  text: 'SEND EMAIL',
                  color: kPrimaryColor,
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text)
                        .then(
                      (value) {
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                        Fluttertoast.showToast(
                          msg: "password sent to email ${emailController.text}",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                           backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        ).onError(
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
                    );
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
