part of 'profile_phone_bloc.dart';

@immutable
sealed class ProfilePhoneState {
    final String phone;
  final bool editPressed;

  ProfilePhoneState({required this.phone, required this.editPressed});
}

final class ProfilePhoneInitial extends ProfilePhoneState {
  ProfilePhoneInitial({required super.phone, required super.editPressed});
}
