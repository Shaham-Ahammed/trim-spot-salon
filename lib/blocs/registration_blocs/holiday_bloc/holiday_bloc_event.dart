part of 'holiday_bloc_bloc.dart';

@immutable
sealed class HolidayBlocEvent {}
class HolidaysSelected extends HolidayBlocEvent {
  final String day;

  HolidaysSelected({required this.day});

}