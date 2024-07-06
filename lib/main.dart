import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seru_wizard/core/services/input_state.dart';
import 'package:seru_wizard/screen/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InputData(),
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
