part of 'eye_button_on_new_password_bloc.dart';

@immutable
sealed class EyeButtonOnNewPasswordState {
  final bool isVisible;

  EyeButtonOnNewPasswordState({required this.isVisible});
}

final class EyeButtonOnNewPasswordInitial extends EyeButtonOnNewPasswordState {
  EyeButtonOnNewPasswordInitial({required super.isVisible});
}
