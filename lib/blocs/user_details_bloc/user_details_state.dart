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
  final String shopName;
  final String shopLocation;
  final String openingTime;
  final String closingTime;
  final String holidays;

  UserDetailsState({required this.profileImage, required this.userName, required this.phone, required this.shopImage, required this.password, required this.email, required this.shopId, required this.shopName, required this.shopLocation, required this.openingTime, required this.closingTime, required this.holidays});
  
}

final class UserDetailsInitial extends UserDetailsState {
  UserDetailsInitial({required super.profileImage, required super.userName, required super.phone, required super.shopImage, required super.password, required super.email, required super.shopId, required super.shopName, required super.shopLocation, required super.openingTime, required super.closingTime, required super.holidays});

}
