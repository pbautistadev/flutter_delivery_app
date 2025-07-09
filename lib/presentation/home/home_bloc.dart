import 'package:flutter/material.dart';

import '../../domain/model/user.dart';
import '../../domain/repository/api_repository.dart';
import '../../domain/repository/local_storage_repository.dart';

class HomeBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  HomeBLoC({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  User user = User.empty();
  int indexSelected = 0;

  // bool updateTheme(bool isDark) {
  //   localRepositoryInterface.saveDarkMode(isDark);
  //   darkTheme(isDark);
  //   return isDark;
  // }

  void loadUser() async {
    user = await localRepositoryInterface.getUser();
    notifyListeners();
  }

  void updateIndexSelected(int index) {
    indexSelected = index;
    notifyListeners();
  }

  // Future<void> logOut() async {
  //   final token = await localRepositoryInterface.getToken();
  //   if (token != null) {
  //     await apiRepositoryInterface.logout(token);
  //     await localRepositoryInterface.clearAllData();
  //   }
  // }
}
