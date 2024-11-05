import 'package:flutter/material.dart';
import 'package:talkio_app/Features/auth/widgets/custom_button.dart';
import 'package:talkio_app/Features/auth/widgets/custom_text_field.dart';
import 'package:talkio_app/utils/colors.dart';
import 'package:talkio_app/widgets/logo_app.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                // CustomTextField(
                //   hintText: 'Enter your new password',
                //   prefixIcon: Icons.lock_outline,
                //   controller: passwordController,
                //   isPass: true,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter your password';
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(
                  height: 6,
                ),
                CustomButton(
                  padding: const EdgeInsets.all(16),
                  text: 'SEND EMAIL',
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.pop(context);
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
