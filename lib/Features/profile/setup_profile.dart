import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/auth/widgets/custom_button.dart';
import 'package:talkio_app/Features/auth/widgets/custom_text_field.dart';
import 'package:talkio_app/firbase/fire_auth.dart';
import 'package:talkio_app/utils/colors.dart';

class SetupProfile extends StatelessWidget {
  SetupProfile({super.key});

  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Iconsax.logout4,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 140.0,
                ),
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Please enter your name',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomTextField(
                  hintText: 'Name',
                  prefixIcon: Iconsax.user,
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  padding: const EdgeInsets.all(16),
                  text: 'Continue',
                  color: kPrimaryColor,
                  onPressed: () async {
                    if (nameController.text.isNotEmpty) {
                      await FirebaseAuth.instance.currentUser!
                          .updateDisplayName(nameController.text)
                          .then(
                            (value) => FireAuth.createUser(),
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
