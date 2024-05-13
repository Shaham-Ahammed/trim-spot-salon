part of 'user_details_bloc.dart';

@immutable
sealed class UserDetailsState {
  final String profileImage;
  final String userName;
  final String phone;
  final String shopImage;
  final String password;
  final String email;
  final String shopId;
  UserDetailsState(
      {required this.profileImage,
      required this.userName,
      required this.phone,
      required this.shopId,
      required this.shopImage,
      required this.password,
      required this.email});
}

final class UserDetailsInitial extends UserDetailsState {
  UserDetailsInitial(
      {required super.profileImage,
      required super.userName,
      required super.phone,
      required super.shopId,
      required super.shopImage,
      required super.password,
      required super.email});
}
