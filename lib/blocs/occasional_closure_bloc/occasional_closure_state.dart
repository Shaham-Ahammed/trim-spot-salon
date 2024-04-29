part of 'occasional_closure_bloc.dart';

@immutable
sealed class OccasionalClosureState {
  final List<DateTime> occasionalHolidays;
  OccasionalClosureState({required this.occasionalHolidays});
}

final class OccasionalClosureInitial extends OccasionalClosureState {
  OccasionalClosureInitial({required super.occasionalHolidays});
}
