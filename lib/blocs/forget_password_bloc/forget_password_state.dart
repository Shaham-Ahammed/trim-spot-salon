part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class LoadingIndicatorOnForgotPassword extends ForgetPasswordState {}

final class PhoneNumberNotRegistered extends ForgetPasswordState {}

final class NetworkError extends ForgetPasswordState{}

final class NavigateToVerfiyOtpPage extends ForgetPasswordState{}