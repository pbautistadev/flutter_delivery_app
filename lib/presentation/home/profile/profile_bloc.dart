import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:flutter/material.dart';

class ProfileBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  ProfileBLoC({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  bool isDark = false;

  void loadTheme() async {
    isDark = await localRepositoryInterface.isDarkMode() ?? false;
    notifyListeners();
  }

  User user = User.empty();
  int indexSelected = 0;

  void updateTheme(bool isDarkValue) {
    localRepositoryInterface.saveDarkMode(isDarkValue);
    isDark = isDarkValue;
    notifyListeners();
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      await apiRepositoryInterface.logout(token);
      await localRepositoryInterface.clearAllData();
    }
  }
}
