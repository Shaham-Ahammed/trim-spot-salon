part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

final class SendOtpButtonPressed extends ForgetPasswordEvent{}