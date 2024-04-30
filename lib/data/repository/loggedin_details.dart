import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/repository/unique_number.dart';
import 'package:trim_spot_barber_side/data/shared_preference_operations/functions.dart';

class LoggedinStreamSnapshot {

  Stream<QuerySnapshot<Object?>> loggedinUserStreamSnapshots()  {
   

    final stream =  CollectionReferences()
        .shopDetailsReference()
        .where(SalonDocumentModel.phone, isEqualTo: uniquePhoneNumber)
        .snapshots();
   
    return stream;
  }
}
