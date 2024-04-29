part of 'register_button_bloc.dart';

@immutable
sealed class RegisterButtonState {
  final bool buttonPressed;

  RegisterButtonState({required this.buttonPressed});
}

final class RegisterButtonInitial extends RegisterButtonState {
  RegisterButtonInitial({required super.buttonPressed});
}

final class NavigateToOtpPage extends RegisterButtonState {
  NavigateToOtpPage({required super.buttonPressed});
}



final class RegisrationFailure extends RegisterButtonState {
  final String error;
  RegisrationFailure(this.error, {required super.buttonPressed});
}



final class NetworkError extends RegisterButtonState{
  NetworkError({required super.buttonPressed});
}

final class PhoneNumberAlreadyRegistered extends RegisterButtonState{
  PhoneNumberAlreadyRegistered({required super.buttonPressed});
}

final class LoadingState extends RegisterButtonState{
  LoadingState({required super.buttonPressed});
}





final class NavigateToRegisterSuccessPage extends RegisterButtonState{
  NavigateToRegisterSuccessPage({required super.buttonPressed});
}