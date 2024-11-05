import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
        children: <Widget>[
          Container(
            child: Center(
              child: Text('Chat'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Group'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Contact'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Setting'),
            ),
          ),
        ],
        physics: const PageScrollPhysics(),
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
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
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.messages),
            label: 'Group',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.user),
            label: 'Contact',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.setting),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
