part of 'working_hours_bloc.dart';

@immutable
sealed class ShopManagementWorkingHoursState {
  final DateTime? openingTime;
  final DateTime? closingTime;
  final String openTimeDisplayText;
  final String closingTimeDisplayText;

  const ShopManagementWorkingHoursState({
    required this.openingTime,
    required this.closingTime,
    required this.openTimeDisplayText,
    required this.closingTimeDisplayText,
  });
}

final class WorkingHoursInitial extends ShopManagementWorkingHoursState {
  WorkingHoursInitial({
    required DateTime? openingTime,
    required DateTime? closingTime,
    required String openTimeDisplayText,
    required String closingTimeDisplayText,
  }) : super(
          openingTime: openingTime,
          closingTime: closingTime,
          openTimeDisplayText: openTimeDisplayText,
          closingTimeDisplayText: closingTimeDisplayText,
        );
}
