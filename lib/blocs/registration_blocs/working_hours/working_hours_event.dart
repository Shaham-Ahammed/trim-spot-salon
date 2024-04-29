part of 'working_hours_bloc.dart';

@immutable
sealed class WorkingHoursEvent {}

final class OpeningTimeSelected extends WorkingHoursEvent {
  final DateTime openingTime;
  OpeningTimeSelected({required this.openingTime});
}

final class ClosingTimeSelected extends WorkingHoursEvent {
  final DateTime closingTime;
  ClosingTimeSelected({required this.closingTime});
}
