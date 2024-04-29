import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'occasional_closure_event.dart';
part 'occasional_closure_state.dart';

class OccasionalClosureBloc
    extends Bloc<OccasionalClosureEvent, OccasionalClosureState> {
  OccasionalClosureBloc()
      : super(OccasionalClosureInitial(occasionalHolidays: [])) {
    on<SelectedADay>(_selectedADay);
  }
  _selectedADay(SelectedADay event, Emitter<OccasionalClosureState> emit) {
    final selectedDays = state.occasionalHolidays;
    if (selectedDays.contains(event.day)) {
      selectedDays.remove(event.day);
    } else {
      selectedDays.add(event.day);
    }
    emit(OccasionalClosureInitial(occasionalHolidays: selectedDays));
  }
}
