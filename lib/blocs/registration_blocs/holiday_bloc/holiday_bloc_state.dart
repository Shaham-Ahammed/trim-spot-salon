part of 'holiday_bloc_bloc.dart';

@immutable
sealed class HolidayBlocState {
 final List<String> holidays;

 const HolidayBlocState({required this.holidays});
}

final class HolidayBlocInitial extends HolidayBlocState {
 HolidayBlocInitial({required List<String> holidays}) : super(holidays: holidays);
}
