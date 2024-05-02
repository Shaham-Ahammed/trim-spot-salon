part of 'occasional_closure_bloc.dart';

@immutable
sealed class OccasionalClosureState {
  final List<DateTime> occasionalHolidays;
  final List<Timestamp> holidaysIntimeStamp;

  OccasionalClosureState({required this.occasionalHolidays, required this.holidaysIntimeStamp});
 
}

final class OccasionalClosureInitial extends OccasionalClosureState {
  OccasionalClosureInitial({required super.occasionalHolidays, required super.holidaysIntimeStamp});
 
}
