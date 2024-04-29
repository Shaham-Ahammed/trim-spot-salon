import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'working_hours_event.dart';
part 'working_hours_state.dart';

class WorkingHoursBloc extends Bloc<WorkingHoursEvent, WorkingHoursState> {
  WorkingHoursBloc()
      : super(WorkingHoursInitial(
            closingTime: null,
            openingTime: null,
            closingTimeDisplayText: "",
            openTimeDisplayText: "")) {
    on<OpeningTimeSelected>(_openingTimeSelected);
    on<ClosingTimeSelected>(_closingTimeSelected);
  }
  _openingTimeSelected(
      OpeningTimeSelected event, Emitter<WorkingHoursState> emit) {
    String formattedTime = DateFormat('hh:mm a').format(event.openingTime);

    emit(
      WorkingHoursInitial(
          closingTimeDisplayText:
              (state as WorkingHoursInitial).closingTimeDisplayText,
          openingTime: event.openingTime,
          closingTime: (state as WorkingHoursInitial).closingTime,
          openTimeDisplayText: formattedTime),
    );
  }

  _closingTimeSelected(
      ClosingTimeSelected event, Emitter<WorkingHoursState> emit) {
    String formattedTime = DateFormat('hh:mm a').format(event.closingTime);
    emit(WorkingHoursInitial(
        openTimeDisplayText: (state as WorkingHoursInitial).openTimeDisplayText,
        openingTime: (state as WorkingHoursInitial).openingTime,
        closingTime: event.closingTime,
        closingTimeDisplayText: formattedTime));
  }
}
