import 'package:injectable/injectable.dart';
import 'package:metrdev_app/util/dio_http_client.dart';

@singleton
class UserAuthenticationService {
  final DioHttpClient _client;

  UserAuthenticationService(this._client);

  Future<(bool isSuccessful, String message)> signIn(String email, String password) async {
    final result = await _client.post("signin", data: {"email": email, "password": password});
    final String responseMessage = result.data["message"];
    return (responseMessage == "success", responseMessage);
  }
}
