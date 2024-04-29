part of 'profile_email_bloc.dart';

@immutable
sealed class ProfileEmailState {
    final String email;
  final bool editPressed;

  ProfileEmailState({required this.email, required this.editPressed});
}

final class ProfileEmailInitial extends ProfileEmailState {
  ProfileEmailInitial({required super.email, required super.editPressed});
}
