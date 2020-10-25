import 'package:delivery_app/domain/exception/auth_exception.dart';
import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/response/login_response.dart';
import 'package:delivery_app/domain/request/login_request.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return User(
        name: 'Carlos',
        username: 'carlos123',
        image: 'assets/rat.png',
      );
    } else if (token == 'AA222') {
      return User(
        name: 'Dan',
        username: 'dan123',
        image: 'assets/rat.png',
      );
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    if (login.username == 'carlos123' && login.password == 'carlos123') {
      return LoginResponse(
        'AA111',
        User(
          name: 'Carlos',
          username: 'carlos123',
          image: 'assets/rat.png',
        ),
      );
    }
    if (login.username == 'dan123' && login.password == 'dan123') {
      return LoginResponse(
        'AA222',
        User(
          name: 'Dan',
          username: 'dan123',
          image: 'assets/rat.png',
        ),
      );
    }

    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server');
    return;
  }
}
