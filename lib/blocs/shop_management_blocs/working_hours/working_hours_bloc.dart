import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';

part 'working_hours_event.dart';
part 'working_hours_state.dart';

class ShopManagementWorkingHoursBloc extends Bloc<
    ShopManagementWorkingHoursEvent, ShopManagementWorkingHoursState> {
  ShopManagementWorkingHoursBloc()
      : super(WorkingHoursInitial(
            closingTime: null,
            openingTime: null,
            closingTimeDisplayText: "",
            openTimeDisplayText: "")) {
    on<ShopManagementOpeningTimeSelected>(_openingTimeSelected);
    on<ShopManagementClosingTimeSelected>(_closingTimeSelected);
    on<FetchingOriginalWorkingTime>(_fetchingOriginalWorkingTime);
  }
  _openingTimeSelected(ShopManagementOpeningTimeSelected event,
      Emitter<ShopManagementWorkingHoursState> emit) {
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

  _closingTimeSelected(ShopManagementClosingTimeSelected event,
      Emitter<ShopManagementWorkingHoursState> emit) {
    String formattedTime = DateFormat('hh:mm a').format(event.closingTime);
    emit(WorkingHoursInitial(
        openTimeDisplayText: (state as WorkingHoursInitial).openTimeDisplayText,
        openingTime: (state as WorkingHoursInitial).openingTime,
        closingTime: event.closingTime,
        closingTimeDisplayText: formattedTime));
  }

  _fetchingOriginalWorkingTime(FetchingOriginalWorkingTime event,
      Emitter<ShopManagementWorkingHoursState> emit) async {
    final shopDetails = await UserDataDocumentFromFirebase().userDocument();
    emit(WorkingHoursInitial(
        openingTime: null,
        closingTime: null,
        openTimeDisplayText: shopDetails[SalonDocumentModel.parsedOpeningTime],
        closingTimeDisplayText:
            shopDetails[SalonDocumentModel.parsedClosingTime]));
  }
}
