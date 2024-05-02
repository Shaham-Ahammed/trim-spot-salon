part of 'holiday_bloc_bloc.dart';

@immutable
sealed class ShopManagementHolidayBlocEvent {}

class HolidaysSelected extends ShopManagementHolidayBlocEvent {
  final String day;

  HolidaysSelected({required this.day});
}


class FetchOriginalHolidays extends ShopManagementHolidayBlocEvent{}