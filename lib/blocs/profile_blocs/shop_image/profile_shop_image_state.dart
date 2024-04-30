part of 'profile_shop_image_bloc.dart';

@immutable
sealed class ProfileShopImageState {
   final Uint8List? newShopImageUnit8list;
  final String newShopImagePath;
  final String originalShopPic;

  ProfileShopImageState({required this.newShopImageUnit8list, required this.newShopImagePath, required this.originalShopPic});


 
}

final class ProfileShopImageInitial extends ProfileShopImageState {
  ProfileShopImageInitial({required super.newShopImageUnit8list, required super.newShopImagePath, required super.originalShopPic});
 
}
