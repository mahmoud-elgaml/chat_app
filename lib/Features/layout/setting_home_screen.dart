import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/layout/widgets/settings_card.dart';
import 'package:talkio_app/Features/settings/profile_screen.dart';
import 'package:talkio_app/Features/settings/qr_code_screen.dart';

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QrCodeScreen(),
                      ),
                    );
                  },
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
                leading: const Icon(
                  Iconsax.user,
                ),
                title: const Text(
                  'Profile',
                ),
              ),
              SettingsCard(
                trailing: const Icon(
                  Icons.mode_night_sharp,
                ),
                leading: const Icon(
                  Iconsax.color_swatch,
                ),
                title: const Text(
                  'Theme',
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: BlockPicker(
                            pickerColor: Colors.indigo,
                            onColorChanged: (color) {},
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Done'),
                          ),
                        ],
                      );
                    },
                  );
                },
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
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                trailing: Icon(
                  Icons.logout_rounded,
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
