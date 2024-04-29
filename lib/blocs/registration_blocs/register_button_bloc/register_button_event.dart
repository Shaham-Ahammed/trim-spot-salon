part of 'register_button_bloc.dart';

@immutable
sealed class RegisterButtonEvent {}

final class RegisterButtonPressed extends RegisterButtonEvent {
  final BuildContext context;

  RegisterButtonPressed({required this.context});
}

final class OtpValidation extends RegisterButtonEvent {
  final BuildContext context;

  OtpValidation({required this.context});
}

final class SubmitOtpButtonPressed extends RegisterButtonEvent {
  final String verificationId;
  final context;
  SubmitOtpButtonPressed(this.context,{required this.verificationId});
}
