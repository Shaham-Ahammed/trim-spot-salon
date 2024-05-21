part of 'profile_password_bloc.dart';

@immutable
sealed class ProfilePasswordState {
  final bool obscureText;

  ProfilePasswordState({required this.obscureText});
}

final class ProfilePasswordInitial extends ProfilePasswordState {
  ProfilePasswordInitial({required super.obscureText});
}

final class PasswordUpdating extends ProfilePasswordState {
  PasswordUpdating({required super.obscureText});
}

final class PasswordUpdated extends ProfilePasswordState {
  PasswordUpdated({required super.obscureText});
}
