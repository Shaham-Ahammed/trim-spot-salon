part of 'save_button_shop_managemen_bloct.dart';

@immutable
sealed class ShopManagementSaveButtonEvent {}

final class SaveChangesButtonPressed extends ShopManagementSaveButtonEvent {
  final BuildContext context;

  SaveChangesButtonPressed({required this.context});
}
