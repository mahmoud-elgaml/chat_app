import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/layout/widgets/settings_card.dart';
import 'package:talkio_app/Features/settings/profile_screen.dart';

class SettingHomeScreen extends StatelessWidget {
  const SettingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Name',
                ),
                leading: const CircleAvatar(
                  radius: 40,
                  child: Text(
                    'img',
                  ),
                ),
                minVerticalPadding: 40,
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.scan_barcode,
                  ),
                ),
              ),
               SettingsCard(
              onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
              },
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                leading:  const Icon(
                  Iconsax.user,
                ),
                title:  const Text(
                  'Profile',
                ),
              ),
              const SettingsCard(
                trailing: Icon(
                  Icons.mode_night_sharp,
                ),
                leading: Icon(
                  Iconsax.color_swatch,
                ),
                title: Text(
                  'Theme',
                ),
              ),
              SettingsCard(
                title: const Text(
                  'Dark Mode',
                ),
                leading: const Icon(
                  Iconsax.colorfilter,
                ),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              SettingsCard(
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout_rounded,
                  ),
                ),
                title: const Text(
                  'Signout',
                ),
                leading: Text(
                  '👋',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
