part of 'holiday_bloc_bloc.dart';

@immutable
sealed class ShopManagementHolidayBlocState {
 final List<String> holidays;

 const ShopManagementHolidayBlocState({required this.holidays});
}

final class HolidayBlocInitial extends ShopManagementHolidayBlocState {
 HolidayBlocInitial({required List<String> holidays}) : super(holidays: holidays);
}
