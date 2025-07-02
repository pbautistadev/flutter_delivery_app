import 'package:get/state_manager.dart';

import '../../domain/model/user.dart';
import '../../domain/repository/api_repository.dart';
import '../../domain/repository/local_storage_repository.dart';

class HomeController extends GetxController {
  final LocalStorageRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  HomeController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  Rx<User> user = User.empty().obs;
  RxInt indexSelected = 0.obs;
  RxBool darkTheme = false.obs;

  @override
  void onReady() {
    loadUser();
    loadCurrentTheme();
    super.onReady();
  }

  void loadCurrentTheme() {
    localRepositoryInterface.isDarkMode().then(
      (value) {
        darkTheme(value);
      },
    );
  }

  bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }

  void loadUser() {
    localRepositoryInterface.getUser().then(
      (value) {
        user(value);
      },
    );
  }

  void updateIndexSelected(int index) {
    indexSelected(index);
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      await apiRepositoryInterface.logout(token);
      await localRepositoryInterface.clearAllData();
    }
  }
}
