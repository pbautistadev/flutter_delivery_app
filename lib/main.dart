import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

import 'presentation/splash/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SplashScreen(),
    );
  }
}
