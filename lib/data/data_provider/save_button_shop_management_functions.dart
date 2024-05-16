import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

class HandlingOccasionalClosures {
  removingAllBookedSlotsFromSlotList(
      BuildContext context, List<String> currentOccasionalClosures) async {
    final DocumentReference slotSelectionBlocReference = CollectionReferences()
        .shopDetailsReference()
        .doc(BlocProvider.of<UserDetailsBloc>(context).state.shopId)
        .collection(FirebaseNamesShopSide.slotBookingCollectionReference)
        .doc(FirebaseNamesShopSide.slotsBookingDocument);

    currentOccasionalClosures.forEach((element) async {
      await slotSelectionBlocReference.update({element: []});
    });
  }

  deleteAllPendingsFromShopSideOnThatDay(
      context, List<String> currentOccasionalClosures) async {
    final CollectionReference dailyBookingCollectionReference =
        CollectionReferences()
            .shopDetailsReference()
            .doc(BlocProvider.of<UserDetailsBloc>(context).state.shopId)
            .collection(FirebaseNamesShopSide.dailyBookingsCollection);

    final QuerySnapshot<Object?> docsInCollection =
        await dailyBookingCollectionReference.get();
    for (var docs in docsInCollection.docs) {
      if (currentOccasionalClosures.contains(docs.id)) {
        final DocumentReference docsNeedToDelete =
            dailyBookingCollectionReference.doc(docs.id);
        await docsNeedToDelete.delete();
      }
    }
  }
}
