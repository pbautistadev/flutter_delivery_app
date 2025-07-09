import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class MainBLoC extends ChangeNotifier {
  ThemeData? currentTheme;

  final LocalRepositoryInterface localRepositoryInterface;

  MainBLoC({required this.localRepositoryInterface});

  void loadTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode() ?? false;
    updateTheme(isDark ? darkTheme : lightTheme);
  }

  void updateTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
