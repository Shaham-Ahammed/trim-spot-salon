part of 'eye_button_on_new_password_bloc.dart';

@immutable
sealed class EyeButtonOnNewPasswordEvent {}

final class EyeButtonPressed extends EyeButtonOnNewPasswordEvent{}