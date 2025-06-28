import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/image.png'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'DeliveryApp',
              textAlign: TextAlign.center,
              style:
                  Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: DeliveryColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
