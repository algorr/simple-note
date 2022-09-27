import 'package:hive/hive.dart';

import '../models/user.dart';

enum UserCreationResult { success, failure, already_exists }

class AuthenticationService {
  late Box<User> _box;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _box = await Hive.openBox('usersBox');
  }

  Future<String?> authenticateUser(String username, String password) async {
    final success = _box.values.any((element) =>
        element.username == username && element.password == password);
    if (success) {
      return username;
    }
    return null;
  }

  Future<UserCreationResult> createUser(        
      String username, String password) async {
    final alreadyExist =
        _box.values.any((element) => element.username == username);
    if (alreadyExist) {
      return UserCreationResult.already_exists;
    }
    try {
      _box.add(User(username, password));
      return UserCreationResult.success;
    } catch (e) {
      print(e);
      return UserCreationResult.failure;
    }
  }
}
