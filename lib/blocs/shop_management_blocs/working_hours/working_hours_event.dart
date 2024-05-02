part of 'working_hours_bloc.dart';

@immutable
sealed class ShopManagementWorkingHoursEvent {}

final class ShopManagementOpeningTimeSelected extends ShopManagementWorkingHoursEvent {
  final DateTime openingTime;
  ShopManagementOpeningTimeSelected({required this.openingTime});
}

final class ShopManagementClosingTimeSelected extends ShopManagementWorkingHoursEvent {
  final DateTime closingTime;
  ShopManagementClosingTimeSelected({required this.closingTime});
}

final class FetchingOriginalWorkingTime extends ShopManagementWorkingHoursEvent{}