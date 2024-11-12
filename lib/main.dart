import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talkio_app/Features/auth/presentation/login_view.dart';
import 'package:talkio_app/firebase_options.dart';
import 'package:talkio_app/layout.dart';
import 'package:talkio_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const LoginView(),
    );
  }
}
