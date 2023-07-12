part of 'login_screen_cubit.dart';

sealed class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenLoadingState implements LoginScreenState {}

class LoginScreenSuccessState implements LoginScreenState {}

class LoginScreenErrorState extends LoginScreenState {
  final String errorMessage;

  LoginScreenErrorState({required this.errorMessage});
}
