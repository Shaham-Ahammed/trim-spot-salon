import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

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
    final id = await UserDataDocumentFromFirebase().userDocument();
    final gettingBookedSlots = await CollectionReferences()
        .shopDetailsReference()
        .doc(id.id)
        .collection(FirebaseNamesShopSide.slotBookingCollectionReference)
        .doc(FirebaseNamesShopSide.slotsBookingDocument)
        .get();
    String today = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final List<String> selectedSlots =
        (gettingBookedSlots.data()![today] as List<dynamic>).cast<String>();
    List<String> currentlySelectedSlots = state.selectedSlots;
    if (selectedSlots.contains(event.time)) {
      return;
    } else {
      if (currentlySelectedSlots.contains(event.time)) {
        currentlySelectedSlots.remove(event.time);
      } else {
        currentlySelectedSlots.add(event.time);
      }
    }
    emit(SlotSelectionInitial(
        selectedSlots: currentlySelectedSlots, totalSlots: state.totalSlots));
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

  _lockSlotsPressed(
      LockSlotsPressed event, Emitter<SlotSelectionState> emit) async {
    final id = await UserDataDocumentFromFirebase().userDocument();
    final gettingBookedSlots = CollectionReferences()
        .shopDetailsReference()
        .doc(id.id)
        .collection(FirebaseNamesShopSide.slotBookingCollectionReference)
        .doc(FirebaseNamesShopSide.slotsBookingDocument);
    final dbData = await gettingBookedSlots.get();
    String today = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final dbSelectedTimes = dbData.data()![today];
    final newBookings = [...dbSelectedTimes, ...state.selectedSlots];
    await gettingBookedSlots.update({today: newBookings});
    emit(SlotSelectionInitial(selectedSlots: [], totalSlots: state.totalSlots));
  }
}
