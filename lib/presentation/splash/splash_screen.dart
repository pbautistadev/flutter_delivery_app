import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  SplashScreen({super.key});

  final splashController = Get.find<SplashController>();

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
