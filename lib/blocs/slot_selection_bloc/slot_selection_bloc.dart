import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';

import 'package:trim_spot_barber_side/utils/homepage/slot_tiles_timings.dart';

part 'slot_selection_event.dart';
part 'slot_selection_state.dart';

class SlotSelectionBloc extends Bloc<SlotSelectionEvent, SlotSelectionState> {
  SlotSelectionBloc()
      : super(SlotSelectionInitial(selectedSlots: [], totalSlots: [])) {
    on<SelectedSlot>(_selectedSlot);
    on<FetchTotalSlots>(_fetchingOpneingAndClosingTime);
    on<FetchingDaysBookedList>(_fetchingDaysBookedList);
  }
  _selectedSlot(SelectedSlot event, Emitter<SlotSelectionState> emit) {
    final List<String> selected = state.selectedSlots;

    if (selected.contains(event.time)) {
      selected.remove(event.time);
      emit(SlotSelectionInitial(
          selectedSlots: selected, totalSlots: state.totalSlots));
    } else {
      if (!booked.contains(event.time)) {
        selected.add(event.time);
        emit(SlotSelectionInitial(
            selectedSlots: selected, totalSlots: state.totalSlots));
      }
    }
  }

  _fetchingOpneingAndClosingTime(
      FetchTotalSlots event, Emitter<SlotSelectionState> emit) async {
    final data = await UserDataDocumentFromFirebase().userDocument();
    final String openingTime = data[SalonDocumentModel.parsedOpeningTime];
    final String closingTime = data[SalonDocumentModel.parsedClosingTime];

    DateFormat format = DateFormat('hh:mm a');
    DateTime opening = format.parse(openingTime);
    DateTime closing = format.parse(closingTime);

    List<String> slots = [];

    for (var i = opening;
        i.isBefore(closing);
        i = i.add(Duration(minutes: 30))) {
      slots.add(format.format(i));
    }
    emit(SlotSelectionInitial(
        selectedSlots: state.selectedSlots, totalSlots: slots));
  }

  _fetchingDaysBookedList(
      FetchingDaysBookedList event, Emitter<SlotSelectionState> emit) async {
    // final List<dynamic> booked = bookedSlotsCollection.get(date);
    // booked.add("9:30");
    // await bookedSlotsReference.set({date: booked});
    //  final List<dynamic> booked1 = bookedSlotsCollection.get(date);
    //     booked1.add("19:30");
    //    await bookedSlotsReference.set({date: booked1});
  }
}
