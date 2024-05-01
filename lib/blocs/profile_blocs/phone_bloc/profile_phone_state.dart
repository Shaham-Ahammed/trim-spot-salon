part of 'profile_phone_bloc.dart';

@immutable
sealed class ProfilePhoneState {

  final bool editPressed;

  ProfilePhoneState({required this.editPressed});
}

final class ProfilePhoneInitial extends ProfilePhoneState {
  ProfilePhoneInitial({ required super.editPressed});
}
