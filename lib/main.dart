import 'package:chat_direct/constants/constants.dart';
import 'package:chat_direct/providers/phone_code_provider.dart';
import 'package:chat_direct/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhoneCodeProvider(),
      child: MaterialApp(
        theme: Constants.textFieldTheme,
        title: 'Chat Direct',
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: MainScreen(),
        ),
      ),
    );
  }
}
