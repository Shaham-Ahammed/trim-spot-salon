import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

class CollectionReferences {
  CollectionReference shopDetailsReference() {
    return FirebaseFirestore.instance.collection('shop_registration');
  }

  CollectionReference userDetailsReference() {
    return FirebaseFirestore.instance
        .collection(FirebaseNamesUserSide.registrationReference);
  }
}
