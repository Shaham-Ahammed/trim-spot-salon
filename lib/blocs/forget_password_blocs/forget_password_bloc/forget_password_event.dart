part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

final class SendOtpButtonPressed extends ForgetPasswordEvent {
  final BuildContext context;

  SendOtpButtonPressed({required this.context});
}

final class ResendOtpButtonPressed extends ForgetPasswordEvent {
  final BuildContext context;

  ResendOtpButtonPressed({required this.context});
}

final class SubmitOtpButtonPressed extends ForgetPasswordEvent {
  final String verificationId;
  final BuildContext  context;

  SubmitOtpButtonPressed({required this.verificationId, required this.context});
}

final class SaveNewPasswordButtonPressed extends ForgetPasswordEvent{}