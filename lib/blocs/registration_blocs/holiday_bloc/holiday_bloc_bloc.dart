

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'holiday_bloc_event.dart';
part 'holiday_bloc_state.dart';

class HolidayBloc extends Bloc<HolidayBlocEvent, HolidayBlocState> {
  HolidayBloc() : super(HolidayBlocInitial(holidays: [])) {
     on<HolidaysSelected>(_holidaySelected);
  }
    void _holidaySelected(
      HolidaysSelected event, Emitter<HolidayBlocState> emit) {
    final currentState = state;

    if (currentState is HolidayBlocInitial) {
      currentState.holidays.contains(event.day)
          ? currentState.holidays.remove(event.day)
          : currentState.holidays.add(event.day);
      emit(HolidayBlocInitial(holidays: currentState.holidays));
    }
  }

}
