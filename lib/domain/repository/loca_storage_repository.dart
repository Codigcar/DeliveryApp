

import 'package:delivery_app/domain/model/user.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<void> clearAllData();
  Future<User> saveUser(User user);
  Future<User> getUser();
}