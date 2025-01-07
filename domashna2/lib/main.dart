import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'services/cart_service.dart';

void main() {
  runApp(const PedaliApp());
}

class PedaliApp extends StatelessWidget {
  const PedaliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pedali',
        theme: ThemeData(
          fontFamily: 'SF Pro Text',
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
