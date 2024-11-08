import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkio_app/Features/layout/chat_home_screen.dart';
import 'package:talkio_app/Features/layout/contact_home_screen.dart';
import 'package:talkio_app/Features/layout/group_home_screen.dart';
import 'package:talkio_app/Features/layout/setting_home_screen.dart';

class LayoutApp extends StatefulWidget {
  const LayoutApp({super.key});

  @override
  State<LayoutApp> createState() => _LayoutAppState();
}

int currentIndex = 0;
PageController pageController = PageController();

class _LayoutAppState extends State<LayoutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const PageScrollPhysics(),
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: const <Widget>[
          ChatHomeScreen(),
          GroupHomeScreen(),
          ContactHomeScreen(),
          SettingHomeScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
            pageController.jumpToPage(value);
          });
        },
        elevation: 0.0,
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.message),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.messages),
            label: 'Groups',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.user),
            label: 'Contacts',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.setting),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
