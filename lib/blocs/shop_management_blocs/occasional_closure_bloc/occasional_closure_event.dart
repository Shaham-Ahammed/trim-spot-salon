part of 'occasional_closure_bloc.dart';

@immutable
sealed class OccasionalClosureEvent {}

final class SelectedADay extends OccasionalClosureEvent {
  final DateTime day;
  SelectedADay({required this.day});
}

final class FetchingOriginalOccasionalHolidays extends OccasionalClosureEvent{}