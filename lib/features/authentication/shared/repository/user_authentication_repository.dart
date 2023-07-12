import 'package:injectable/injectable.dart';
import 'package:metrdev_app/exceptions/exceptions.dart';
import 'package:metrdev_app/features/authentication/shared/service/user_authentication_service.dart';

@singleton
class UserAuthenticationRepository {
  final UserAuthenticationService _userAuthService;

  UserAuthenticationRepository(this._userAuthService);

  Future<void> signIn(String email, String password) async {
    final (bool isSuccessful, String message) = await _userAuthService.signIn(email, password);
    if (!isSuccessful) throw UserSignInFailedException(message);
  }
}
