import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/repository/unique_number.dart';

class UserDataDocumentFromFirebase {
 Future<QueryDocumentSnapshot<Object?>> userDocument() async {
    final collectionReference = await CollectionReferences()
        .shopDetailsReference()
        .where(SalonDocumentModel.phone, isEqualTo: uniquePhoneNumber)
        .get();
    final data = collectionReference.docs.first;
    return data;
  }
}
