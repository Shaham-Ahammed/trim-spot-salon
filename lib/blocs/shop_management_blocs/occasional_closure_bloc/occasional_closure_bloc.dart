import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';

part 'occasional_closure_event.dart';
part 'occasional_closure_state.dart';

class OccasionalClosureBloc
    extends Bloc<OccasionalClosureEvent, OccasionalClosureState> {
  OccasionalClosureBloc()
      : super(OccasionalClosureInitial(
            occasionalHolidays: [], holidaysIntimeStamp: [])) {
    on<SelectedADay>(_selectedADay);
    on<FetchingOriginalOccasionalHolidays>(_fetchingOriginalOccasionalHolidays);
  }
  _selectedADay(SelectedADay event, Emitter<OccasionalClosureState> emit) {
    //checking wether the date is already present in the array
    final selectedDays = state.occasionalHolidays;
    //converting from datetime.now() to particular date at 12:00 am for everything
    final day = DateTime(event.day.year, event.day.month, event.day.day);
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
    // converting to timestamp
    final List<Timestamp> newTimeStamps = [];
    selectedDays.forEach((element) {
      final convertedElement =
          DateTime(element.year, element.month, element.day);
      Timestamp timestamp = Timestamp.fromDate(convertedElement);

      newTimeStamps.add(timestamp);
    });

    emit(OccasionalClosureInitial(
        occasionalHolidays: selectedDays, holidaysIntimeStamp: newTimeStamps));
  }

  _fetchingOriginalOccasionalHolidays(FetchingOriginalOccasionalHolidays event,
      Emitter<OccasionalClosureState> emit) async {
    final data = await UserDataDocumentFromFirebase().userDocument();
    final List<Timestamp> occasionalClosuresInTimeStamp =
        (data[SalonDocumentModel.occasionalClosures] as List<dynamic>)
            .cast<Timestamp>();
    //converting timestamp to datetime
    final List<DateTime> occasionalClosuresInDateTime = [];
    occasionalClosuresInTimeStamp.forEach((element) {
      DateTime dateTime = element.toDate();
      occasionalClosuresInDateTime.add(dateTime);
    });

    emit(OccasionalClosureInitial(
        occasionalHolidays: occasionalClosuresInDateTime,
        holidaysIntimeStamp: occasionalClosuresInTimeStamp));
  }
}
