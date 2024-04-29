part of 'profile_shop_image_bloc.dart';

@immutable
sealed class ProfileShopImageState {
  final String ShopImage;
  final String newShopImage;

  ProfileShopImageState({
    required this.ShopImage,
 required this.newShopImage
  });
}

final class ProfileShopImageInitial extends ProfileShopImageState {
  ProfileShopImageInitial({
    required super.ShopImage, required super.newShopImage,
  });
}
