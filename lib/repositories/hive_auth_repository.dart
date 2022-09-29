import '../services/authentication_service.dart';

class HiveAuthRepository {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<void> init() async {
   await _authenticationService.init();
  }

  Future<String?> authenticateUser(String username, String password)  async {
    String? user =
        await _authenticationService.authenticateUser(username, password);
    return user;
  }

  Future<UserCreationResult> createUser(
      String username, String password) async {
    UserCreationResult result =
        await _authenticationService.createUser(username, password);
    return result;
  }
}
