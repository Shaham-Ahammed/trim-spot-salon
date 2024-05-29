import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

class SlotSelectionFunctions {
  Future<bool?> selectedSlots(
      {required String time, required List<String> selectedSlotsFromBloc}) async {
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
    List<String> currentlySelectedSlots = selectedSlotsFromBloc;
    print(currentlySelectedSlots);
    if (selectedSlots.contains(time)) {
      return null;
    } else {
      if (currentlySelectedSlots.contains(time)) {
        print("here");
        return false;
      } else {
        print("hereeee");
        return true;
      }
    }
  }

  Future<List<String>> fetchingTimeForSlotsPreparation() async {
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
    return slots;
  }

  addingSelectedSlotsAsBookedInToFirebase(List<String> selectedSlots) async {
    final id = await UserDataDocumentFromFirebase().userDocument();
    final gettingBookedSlots = CollectionReferences()
        .shopDetailsReference()
        .doc(id.id)
        .collection(FirebaseNamesShopSide.slotBookingCollectionReference)
        .doc(FirebaseNamesShopSide.slotsBookingDocument);
    final dbData = await gettingBookedSlots.get();
    String today = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final dbSelectedTimes = dbData.data()![today];
    final newBookings = [...dbSelectedTimes, ...selectedSlots];
    await gettingBookedSlots.update({today: newBookings});
  }
}
