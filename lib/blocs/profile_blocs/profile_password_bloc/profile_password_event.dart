part of 'profile_password_bloc.dart';

@immutable
sealed class ProfilePasswordEvent {}

final class PressedSubmitButtonPressed extends ProfilePasswordEvent {
  final BuildContext context;

  PressedSubmitButtonPressed({required this.context});
}
