
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

Future<int> futureFucntion() async {
  int tot = 0;
  final collection = await CollectionReferences()
      .shopDetailsReference()
      .doc(UserDataDocumentFromFirebase.shopId)
      .collection(FirebaseNamesShopSide.dailyBookingsCollection)
      .get();
  for (var docs in collection.docs) {
    final col = await docs.reference
        .collection(FirebaseNamesShopSide.bookingDetailsCollection)
        .get();
    for (var documents in col.docs) {
      int i = int.parse(documents['totalAmount']);
      tot += i;
    }
  }
  return tot;
}
