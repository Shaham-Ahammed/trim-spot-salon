import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';

part 'occasional_closure_event.dart';
part 'occasional_closure_state.dart';

class OccasionalClosureBloc
    extends Bloc<OccasionalClosureEvent, OccasionalClosureState> {
  OccasionalClosureBloc()
      : super(OccasionalClosureInitial(
          occasionalHolidays: [],
        )) {
    on<SelectedADay>(_selectedADay);
    on<FetchingOriginalOccasionalHolidays>(_fetchingOriginalOccasionalHolidays);
  }
  _selectedADay(SelectedADay event, Emitter<OccasionalClosureState> emit) {
    final String selected = DateFormat('dd-MM-yyyy').format(event.day);
    List<String> blocHolidays = state.occasionalHolidays;

    if (blocHolidays.contains(selected)) {
      blocHolidays.remove(selected);
    } else {
      blocHolidays.add(selected);
    }
    print("shaham $blocHolidays");
    emit(OccasionalClosureInitial(occasionalHolidays: blocHolidays));
  }

  _fetchingOriginalOccasionalHolidays(FetchingOriginalOccasionalHolidays event,
      Emitter<OccasionalClosureState> emit) async {
    final data = await UserDataDocumentFromFirebase().userDocument();
    List<String> firebaseOccasionalHolidays =
        (data[SalonDocumentModel.occasionalClosures] as List<dynamic>)
            .cast<String>();

    emit(OccasionalClosureInitial(
      occasionalHolidays: firebaseOccasionalHolidays,
    ));
  }
}
