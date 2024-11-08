import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/auth/widgets/custom_button.dart';
import 'package:talkio_app/Features/layout/widgets/settings_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    nameController.text = 'Mahmoud';
  }

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 60,
                  ),
                  Positioned(
                    bottom: -1,
                    right: -3,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.edit,
                        size: 28.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SettingsCard(
              leading: Icon(
                Icons.mark_email_read_outlined,
              ),
              title: Text('mahmoud@gmail.com'),
            ),
            SettingsCard(
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.edit_2,
                ),
              ),
              leading: const Icon(
                Iconsax.user_octagon,
              ),
              title: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: InputBorder.none,
                  enabled: false,
                ),
              ),
            ),
            SettingsCard(
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.edit_2,
                ),
              ),
              leading: const Icon(
                Iconsax.information4,
              ),
              title: const TextField(
                decoration: InputDecoration(
                  labelText: 'About',
                  border: InputBorder.none,
                  enabled: false,
                ),
              ),
            ),
            const SettingsCard(
              leading: Icon(
                Iconsax.link,
              ),
              title: Text(
                '11/01/2003',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomButton(
              text: 'Save',
              // color: kPrimaryColor,
              padding:  EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}
