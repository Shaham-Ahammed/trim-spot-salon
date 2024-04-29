part of 'login_validation_bloc.dart';

@immutable
sealed class LoginValidationState {}

final class LoginValidationInitial extends LoginValidationState {}

final class LoginSuccess extends LoginValidationState {}

final class ValidatingLogin extends LoginValidationState{}

final class LoginFailure extends LoginValidationState {
  final String exception;

  LoginFailure(this.exception);
}

final class NetworkError extends LoginValidationState{}

final class LoginLoadingState extends LoginValidationState{}