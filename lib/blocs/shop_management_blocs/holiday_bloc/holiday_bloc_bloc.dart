import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';

part 'holiday_bloc_event.dart';
part 'holiday_bloc_state.dart';

class ShopManagementHolidayBloc extends Bloc<ShopManagementHolidayBlocEvent,
    ShopManagementHolidayBlocState> {
  ShopManagementHolidayBloc() : super(HolidayBlocInitial(holidays: [])) {
    on<HolidaysSelected>(_holidaySelected);
    on<FetchOriginalHolidays>(_fetchOriginalHolidays);
  }
  void _holidaySelected(
      HolidaysSelected event, Emitter<ShopManagementHolidayBlocState> emit) {
    state.holidays.contains(event.day)
        ? state.holidays.remove(event.day)
        : state.holidays.add(event.day);
    emit(HolidayBlocInitial(holidays: state.holidays));
  }

  _fetchOriginalHolidays(FetchOriginalHolidays event,
      Emitter<ShopManagementHolidayBlocState> emit) async {
    emit(HolidayBlocInitial(holidays: []));
    final data = await UserDataDocumentFromFirebase().userDocument();

    List<String> holidays =( data[SalonDocumentModel.holidays] as List<dynamic>).cast<String>() ;
    emit(HolidayBlocInitial(holidays: holidays));
  }
}
