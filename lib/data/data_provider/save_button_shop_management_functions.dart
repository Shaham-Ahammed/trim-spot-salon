import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';
import 'package:trim_spot_barber_side/models/wallet_model.dart';

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

  changingThePendingToCancelledInUserSide(
      context, List<String> currentOccasionalClosures) async {
    currentOccasionalClosures.forEach((element) async {
      final dailyBookingData = await CollectionReferences()
          .shopDetailsReference()
          .doc(BlocProvider.of<UserDetailsBloc>(context).state.shopId)
          .collection(FirebaseNamesShopSide.dailyBookingsCollection)
          .doc(element)
          .collection(FirebaseNamesShopSide.bookingDetailsCollection)
          .get();

      print(dailyBookingData.docs.length);
      final documentsOfPending = dailyBookingData.docs;

      for (var doc in documentsOfPending) {
        print("shaham ${doc.id}");
        final customerUserId = doc[BookingsShopSideDocumentModel.userDocId];
        final serviceTime = doc[BookingsShopSideDocumentModel.time];
        final shopId = BlocProvider.of<UserDetailsBloc>(context, listen: false)
            .state
            .shopId;
        final amount = doc[BookingsShopSideDocumentModel.totalAmount];

        final userBookingDocumentRef = await CollectionReferences()
            .userDetailsReference()
            .doc(customerUserId)
            .collection(FirebaseNamesUserSide.bookingHistoryCollectionReference)
            .where(BookingHisotryUserDocumentModel.shopId, isEqualTo: shopId)
            .where(BookingHisotryUserDocumentModel.time, isEqualTo: serviceTime)
            .get();

        final docIdOfUserBookingHistory = userBookingDocumentRef.docs.first.id;
        final updationDocumentRefernece = CollectionReferences()
            .userDetailsReference()
            .doc(customerUserId)
            .collection(FirebaseNamesUserSide.bookingHistoryCollectionReference)
            .doc(docIdOfUserBookingHistory);

        await updationDocumentRefernece.update({
          BookingHisotryUserDocumentModel.currentStatus:
              BookingHisotryUserDocumentModel.currentStatusCancelled
        });
        await addAmountToUserWallet(customerUserId, amount);
      }
    });
  }

  addAmountToUserWallet(String customerUserId, String amount) async {
    final CollectionReference walletReference = CollectionReferences()
        .userDetailsReference()
        .doc(customerUserId)
        .collection(FirebaseNamesUserSide.walletcollectionReference);

    final shopDetails = await UserDataDocumentFromFirebase().userDocument();
    final shopName = shopDetails[SalonDocumentModel.shopName];
    final String today =
        DateFormat('dd MMM yyyy').format(DateTime.now()).toUpperCase();

    final data = WalletModel(
            shopName: shopName,
            transferDate: today,
            action: WalletUserDocumentModel.refund,
            amount: amount,
            timeStamp: Timestamp.now(),
            credit: true)
        .toMap();

    await walletReference.add(data);
  }

  deleteAllPendingsFromShopSideOnThatDay(
      context, List<String> currentOccasionalClosures) async {
    final CollectionReference dailyBookingCollectionReference =
        CollectionReferences()
            .shopDetailsReference()
            .doc(BlocProvider.of<UserDetailsBloc>(context, listen: false)
                .state
                .shopId)
            .collection(FirebaseNamesShopSide.dailyBookingsCollection);

    currentOccasionalClosures.forEach((element) async {
      final docsRefOfSpecificDate = await dailyBookingCollectionReference
          .doc(element)
          .collection(FirebaseNamesShopSide.bookingDetailsCollection)
          .get();
      final docsNeedToBeDeleted = docsRefOfSpecificDate.docs;
      for (var document in docsNeedToBeDeleted) {
        final DocumentReference docRef = dailyBookingCollectionReference
            .doc(element)
            .collection(FirebaseNamesShopSide.bookingDetailsCollection)
            .doc(document.id);

        await docRef.delete();
      }
    });
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
