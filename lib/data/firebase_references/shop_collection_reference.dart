


import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionReferences{


CollectionReference shopDetailsReference(){
  return  FirebaseFirestore.instance.collection('shop_registration');
}
}
