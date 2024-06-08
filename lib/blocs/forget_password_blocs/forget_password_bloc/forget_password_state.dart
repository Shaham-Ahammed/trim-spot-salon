part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class LoadingIndicatorOnForgotPassword extends ForgetPasswordState {}

final class PhoneNumberNotRegistered extends ForgetPasswordState {}

final class NetworkError extends ForgetPasswordState{}

final class NavigateToVerfiyOtpPage extends ForgetPasswordState{}

final class OtpVerfied extends ForgetPasswordState{}

final class OtpVerificationFailed extends ForgetPasswordState{}

final class PasswordUpdationSuccessfull extends ForgetPasswordState{}

final class PasswordUpdationFailed extends ForgetPasswordState{}