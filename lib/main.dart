import 'package:flutter/material.dart';
import 'package:talkio_app/layout.dart';
import 'package:talkio_app/utils/colors.dart';

void main() {
  runApp(const Talkio());
}

class Talkio extends StatelessWidget {
  const Talkio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const LayoutApp(),
    );
  }
}
