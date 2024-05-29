import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/slot_selection.dart';

part 'slot_selection_event.dart';
part 'slot_selection_state.dart';

class SlotSelectionBloc extends Bloc<SlotSelectionEvent, SlotSelectionState> {
  SlotSelectionBloc()
      : super(SlotSelectionInitial(selectedSlots: [], totalSlots: [])) {
    on<SelectedSlot>(_selectedSlot);
    on<FetchTotalSlots>(_fetchingOpneingAndClosingTime);
    on<LockSlotsPressed>(_lockSlotsPressed);
  }

  _selectedSlot(SelectedSlot event, Emitter<SlotSelectionState> emit) async {
    final toAdd = await SlotSelectionFunctions()
        .selectedSlots(selectedSlotsFromBloc: state.selectedSlots, time: event.time);
    if (toAdd != null) {
      if (toAdd) {
        final alreadySelected = state.selectedSlots;
        alreadySelected.add(event.time);
        emit(SlotSelectionInitial(
            selectedSlots: alreadySelected, totalSlots: state.totalSlots));
      } else if (!toAdd) {
        final alreadySelected = state.selectedSlots;
        alreadySelected.remove(event.time);
        emit(SlotSelectionInitial(
            selectedSlots: alreadySelected, totalSlots: state.totalSlots));
      }
    }
  }

  _fetchingOpneingAndClosingTime(
      FetchTotalSlots event, Emitter<SlotSelectionState> emit) async {
    final List<String> slots =
        await SlotSelectionFunctions().fetchingTimeForSlotsPreparation();

    emit(SlotSelectionInitial(
        selectedSlots: state.selectedSlots, totalSlots: slots));
  }

  _lockSlotsPressed(
      LockSlotsPressed event, Emitter<SlotSelectionState> emit) async {
    try {
      await SlotSelectionFunctions()
          .addingSelectedSlotsAsBookedInToFirebase(state.selectedSlots);
    } catch (e) {
      print("Error while adding");
    }
    emit(SlotSelectionInitial(selectedSlots: [], totalSlots: state.totalSlots));
  }
}
