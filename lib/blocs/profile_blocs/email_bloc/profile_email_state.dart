part of 'profile_email_bloc.dart';

@immutable
sealed class ProfileEmailState {

  final bool editPressed;

  ProfileEmailState({ required this.editPressed});
}

final class ProfileEmailInitial extends ProfileEmailState {
  ProfileEmailInitial({ required super.editPressed});
}
