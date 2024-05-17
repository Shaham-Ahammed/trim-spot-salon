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
    final currentlySelectedSlots = await SlotSelectionFunctions()
        .selectedSlots(selectedSlots: state.selectedSlots, time: event.time);

    emit(SlotSelectionInitial(
        selectedSlots: currentlySelectedSlots, totalSlots: state.totalSlots));
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
