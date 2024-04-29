


import 'package:cloud_firestore/cloud_firestore.dart';

class ShopDetailsReference{


CollectionReference shopDetailsReference(){
  return  FirebaseFirestore.instance.collection('shop_registration');
}
}
