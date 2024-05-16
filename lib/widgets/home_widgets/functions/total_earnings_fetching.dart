import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

Future<int> futureFucntion(BuildContext context) async {
  int tot = 0;
  final collection = await CollectionReferences()
      .shopDetailsReference()
      .doc(BlocProvider.of<UserDetailsBloc>(context).state.shopId)
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
