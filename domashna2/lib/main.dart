import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const PedaliApp());
}

class PedaliApp extends StatelessWidget {
  const PedaliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedali',
      theme: ThemeData(
        fontFamily: 'SF Pro Text',
      ),
      home: const WelcomeScreen(),
    );
  }
}
