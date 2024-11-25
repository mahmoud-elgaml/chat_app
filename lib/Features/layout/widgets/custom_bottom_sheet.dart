import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/auth/widgets/custom_button.dart';
import 'package:talkio_app/Features/auth/widgets/custom_text_field.dart';
import 'package:talkio_app/firbase/fire_database.dart';
import 'package:talkio_app/utils/colors.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({
    super.key,
  });
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Enter Friend Email',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              IconButton.filled(
                onPressed: () {},
                icon: Icon(
                  Iconsax.scan_barcode,
                  size: 20,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          CustomTextField(
            hintText: 'Email',
            prefixIcon: Iconsax.direct_inbox,
            controller: emailController,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
            text: 'Create Chat',
            color: Theme.of(context).colorScheme.primaryContainer,
            padding: const EdgeInsets.all(16),
            onPressed: () {
              if (emailController.text.isNotEmpty) {
                FireData().createRoom(emailController.text);
                Navigator.pop(context);
              }else{
                return ;
              }
            },
          ),
        ],
      ),
    );
  }
}
