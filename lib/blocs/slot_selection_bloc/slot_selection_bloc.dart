import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trim_spot_barber_side/utils/homepage/slot_tiles_timings.dart';

part 'slot_selection_event.dart';
part 'slot_selection_state.dart';

class SlotSelectionBloc extends Bloc<SlotSelectionEvent, SlotSelectionState> {
  SlotSelectionBloc() : super(SlotSelectionInitial(selectedSlots: [])) {
    on<SelectedSlot>(_selectedSlot);
  }
  _selectedSlot(SelectedSlot event, Emitter<SlotSelectionState> emit) {
    final List<String> selected = state.selectedSlots;
    
    if (selected.contains(event.time)) {
      selected.remove(event.time);
      emit(SlotSelectionInitial(selectedSlots: selected));
    } else {
      if (!booked.contains(event.time)) {
        selected.add(event.time);
      emit(SlotSelectionInitial(selectedSlots: selected));
      }
      
    }
  }
}
