import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

class SlotTileFucntions {


fetchingBookedSlots() async {
   // final data = await UserDataDocumentFromFirebase().userDocument();
    String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final bookedSlotsReference = await CollectionReferences()
        .shopDetailsReference()
        .doc(UserDataDocumentFromFirebase.shopId)
        .collection(FirebaseNamesShopSide.bookingCollectionReference)
        .doc(FirebaseNamesShopSide.slotsBookingDocument);
    final bookedSlotsCollection = await bookedSlotsReference.get();

    if (bookedSlotsCollection.data()!.containsKey(date)) {
      print("Already present");
    } else {
      await bookedSlotsReference.update(
        {date: []},
      );
    }
   
  }
}
