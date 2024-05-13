import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/shared_preference_operations/functions.dart';

class UserDataDocumentFromFirebase {
  Future<QueryDocumentSnapshot<Object?>> userDocument() async {
    final phone = await SharedPreferenceOperation().getPhoneNumber();
    final collectionReference = await CollectionReferences()
        .shopDetailsReference()
        .where(SalonDocumentModel.phone, isEqualTo: phone)
        .get();
    final data = collectionReference.docs.first;
    return data;
  }

  // static late String shopId;
  // getShopId() async {
  //   final userDoc = await userDocument();
  //   shopId = userDoc.id;
  // }
}
