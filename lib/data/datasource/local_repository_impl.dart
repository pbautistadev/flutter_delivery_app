import 'package:delivery_app/domain/exception/auth_exception.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/user.dart';

const _prefToken = 'TOKEN';
const _prefUsername = 'USERNAME';
const _prefName = 'NAME';
const _prefImage = 'IMAGE';
const _prefDarkTheme = 'THEME_DARK';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(_prefToken);
    return token;
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefToken, token);
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getString(_prefUsername);
    final name = sharedPreferences.getString(_prefName);
    final image = sharedPreferences.getString(_prefImage);

    final user = User(
      username: username ?? '',
      name: name ?? '',
      image: image ?? '',
    );

    return user;
  }

  @override
  Future<User> saveUser(User? user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (user != null) {
      sharedPreferences.setString(_prefUsername, user.username.toString());
      sharedPreferences.setString(_prefName, user.name.toString());
      sharedPreferences.setString(_prefImage, user.image.toString());
      return user;
    }
    throw AuthException();
  }

  @override
  Future<bool?> isDarkMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_prefDarkTheme);
  }

  @override
  Future<void> saveDarkMode(bool darkMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_prefDarkTheme, darkMode);
  }
}
