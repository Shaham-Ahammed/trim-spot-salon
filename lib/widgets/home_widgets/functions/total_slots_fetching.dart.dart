import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

class SlotTileFucntions {


fetchingBookedSlots(BuildContext context) async {
   // final data = await UserDataDocumentFromFirebase().userDocument();
    String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final bookedSlotsReference = await CollectionReferences()
        .shopDetailsReference()
        .doc(BlocProvider.of<UserDetailsBloc>(context).state.shopId)
        .collection(FirebaseNamesShopSide.slotBookingCollectionReference)
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
