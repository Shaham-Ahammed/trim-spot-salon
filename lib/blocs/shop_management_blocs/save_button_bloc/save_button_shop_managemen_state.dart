part of 'save_button_shop_managemen_bloct.dart';

@immutable
sealed class ShopManagementSaveButtonState {}

final class ShopManagementSaveButtonStateInitial extends ShopManagementSaveButtonState {}

final class ShopMangaementLoadingIndicator extends ShopManagementSaveButtonState{}