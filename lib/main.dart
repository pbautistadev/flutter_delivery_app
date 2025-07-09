import 'package:delivery_app/data/datasource/api_repository_impl.dart';
import 'package:delivery_app/data/datasource/local_repository_impl.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/home/cart/cart_bloc.dart';
import 'package:delivery_app/presentation/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/splash/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiRepositoryInterface>(
          create: (_) => ApiRepositoryImpl(),
        ),
        Provider<LocalRepositoryInterface>(
          create: (_) => LocalRepositoryImpl(),
        ),
        ChangeNotifierProvider(
          create: (context) {
            return MainBLoC(
              localRepositoryInterface: context
                  .read<LocalRepositoryInterface>(),
            )..loadTheme();
          },
        ),
        ChangeNotifierProvider(
          create: (_) => CartBLoC(),
        ),
      ],
      child: Builder(
        builder: (newContext) {
          return Consumer<MainBLoC>(
            builder: (context, bloc, _) {
              return bloc.currentTheme == null
                  ? const SizedBox.shrink()
                  : MaterialApp(
                      theme: bloc.currentTheme,
                      debugShowCheckedModeBanner: false,
                      home: SplashScreen.init(newContext),
                    );
            },
          );
        },
      ),
    );
  }
}
