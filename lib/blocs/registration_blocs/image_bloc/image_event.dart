part of 'image_bloc.dart';

@immutable
sealed class ImageEvent {}

final class PickingShopLicense extends ImageEvent{} 
 
final class PickingProfile extends ImageEvent{}

final class PickingShopImage extends ImageEvent{}