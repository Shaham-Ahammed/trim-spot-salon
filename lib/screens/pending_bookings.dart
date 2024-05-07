import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/network_stream/network_stream.dart';
import 'package:trim_spot_barber_side/utils/no_network_display_widget.dart';
import 'package:trim_spot_barber_side/widgets/bookings_widgets/listview_pendings.dart';
import 'package:trim_spot_barber_side/widgets/bookings_widgets/nopendings.dart';
import 'package:trim_spot_barber_side/widgets/bookings_widgets/shimmer_effect.dart';

class PendingBookingsScreen extends StatelessWidget {
  const PendingBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
          child: StreamBuilder<bool>(
              stream: checkInternetconnectivity(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 return CircularProgressIndicator(color: blackColor,);
                }

                if (!snapshot.data!) {
                  return NoNetworkDisplayWidget();
                }
                return Padding(
                  padding: EdgeInsets.all(mediaqueryHeight(0.03, context)),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: CollectionReferences()
                          .shopDetailsReference()
                          .doc(UserDataDocumentFromFirebase.shopId)
                          .collection(
                              FirebaseNamesShopSide.dailyBookingsCollection)
                          .doc(DateFormat("dd-MM-yyyy").format(DateTime.now()))
                          .collection(
                              FirebaseNamesShopSide.bookingDetailsCollection)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ShimmerEffectBookingsPage();
                        }

                        if (!snapshot.hasData) {
                          return noPendings(context);
                        }
                        if (snapshot.data!.docs.isEmpty) {
                          return noPendings(context);
                        }

                        List<DocumentSnapshot> filteredDocs = [];
                        DateTime currentTime = (DateTime.now());
                        for (var doc in snapshot.data!.docs) {
                          String timeString = doc['time'].split('-')[1].trim();
                          List<String> timeParts = timeString.split(" ");
                          String time = timeParts[0];
                          String meridian = timeParts[1];

                          String combinedTimeString =
                              DateFormat("yyyy-MM-dd").format(currentTime) +
                                  " " +
                                  time +
                                  " " +
                                  meridian;
                          DateTime parsedTime = DateFormat("yyyy-MM-dd hh:mm a")
                              .parse(combinedTimeString);

                          if (currentTime.isBefore(parsedTime)) {
                            filteredDocs.add(doc);
                          }
                        }
                        if (filteredDocs.isEmpty) {
                          return noPendings(context);
                        } else {
                          return pendingLists(filteredDocs);
                        }
                      }),
                );
              })),
    );
  }
}
