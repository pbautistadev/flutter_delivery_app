import 'package:delivery_app/domain/exception/auth_exception.dart';
import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/request/login_request.dart';
import 'package:delivery_app/domain/response/login_response.dart';

import '../in_memory_products.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return User(
        name: 'Patrick Bautista',
        username: 'patrickbautista',
        image: 'assets/images/foto-perfil-con-fondo.jpg',
      );
    } else if (token == 'AA222') {
      return User(
        name: 'Steve Jobs',
        username: 'stevejobs',
        image: 'assets/images/foto-perfil-con-fondo.jpg',
      );
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    if (login.username == 'patrick' && login.password == 'bautista') {
      return LoginResponse(
        'AA111',
        User(
          name: 'Patrick Bautista',
          username: 'patrickbautista',
          image: 'assets/images/foto-perfil-con-fondo.jpg',
        ),
      );
    } else if (login.username == 'steve' && login.password == 'jobs') {
      return LoginResponse(
        'AA222',
        User(
          name: 'Steve Jobs',
          username: 'stevejobs',
          image: 'assets/images/foto-perfil-con-fondo.jpg',
        ),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('Removing token from server: $token');
    return;
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return products;
  }
}
