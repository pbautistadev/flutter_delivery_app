import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:flutter/material.dart';

class SplashBloC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashBloC({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  // void validateTheme() async {
  //   final isDark = await localRepositoryInterface.isDarkMode();
  //   if (isDark != null) {
  //     Get.changeTheme(isDark ? darkTheme : lightTheme);
  //   } else {
  //     Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
  //   }
  // }

  Future<bool> validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      return true;
    } else {
      return false;
    }
  }
}
