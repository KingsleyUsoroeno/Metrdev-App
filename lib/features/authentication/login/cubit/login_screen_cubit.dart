import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:metrdev_app/exceptions/exceptions.dart';
import 'package:metrdev_app/features/authentication/shared/repository/user_authentication_repository.dart';

part 'login_screen_state.dart';

@injectable
class LoginScreenCubit extends Cubit<LoginScreenState> {
  final UserAuthenticationRepository _authenticationRepository;

  LoginScreenCubit(this._authenticationRepository) : super(LoginScreenInitial());

  void signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return;
    try {
      emit(LoginScreenLoadingState());
      await _authenticationRepository.signIn(email, password);
      emit(LoginScreenSuccessState());
    } on UserSignInFailedException catch (exception) {
      debugPrint("UserSignInFailedException is ${exception.message}");
      emit(LoginScreenErrorState(errorMessage: exception.message));
    } on ConnectionException {
      emit(LoginScreenErrorState(errorMessage: ""));
    } catch (exception, stackTrace) {
      final String errorMessage = "$exception$stackTrace";
      debugPrint("logged error message is $errorMessage");
      emit(LoginScreenErrorState(errorMessage: "Something went wrong :), please try again"));
    }
  }
}
