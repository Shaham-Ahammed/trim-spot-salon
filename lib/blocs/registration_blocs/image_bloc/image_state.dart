part of 'image_bloc.dart';

@immutable
sealed class ImageState {
  final String LicensemagePath;
  final Uint8List? LicenseInBytes;
  final String ProfileImagePath;
  final Uint8List? ProfileInBytes;
  final String ShopImageImagePath;
  final Uint8List? ShopImageInBytes;

  ImageState(
      {required this.LicensemagePath,
      required this.LicenseInBytes,
      required this.ProfileImagePath,
      required this.ProfileInBytes,
      required this.ShopImageImagePath,
      required this.ShopImageInBytes});
}

final class ImageInitial extends ImageState {
  ImageInitial(
      {required super.LicensemagePath,
      required super.LicenseInBytes,
      required super.ProfileImagePath,
      required super.ProfileInBytes,
      required super.ShopImageImagePath,
      required super.ShopImageInBytes});
}
