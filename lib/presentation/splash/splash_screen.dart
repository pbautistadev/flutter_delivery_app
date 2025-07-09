import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/login/login_screen.dart';

import 'splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBloC(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => SplashScreen._(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _init() async {
    final bloc = context.read<SplashBloC>();
    final result = await bloc.validateSession();

    if (result) {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(
        MaterialPageRoute(builder: (newContext) => HomeScreen.init(newContext)),
      );
    } else {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(
        MaterialPageRoute(
          builder: (newContext) => LoginScreen.init(newContext),
        ),
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
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
