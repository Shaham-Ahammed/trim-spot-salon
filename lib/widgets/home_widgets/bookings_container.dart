import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class BookingsPageView extends StatelessWidget {
  const BookingsPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: mediaqueryHeight(0.01, context),
          vertical: mediaqueryHeight(0.004, context)),
      decoration: BoxDecoration(color: appBarColor),
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
          stream: CollectionReferences()
              .shopDetailsReference()
              .doc(BlocProvider.of<UserDetailsBloc>(context).state.shopId)
              .collection(FirebaseNamesShopSide.dailyBookingsCollection)
              .doc(DateFormat("dd-MM-yyyy").format(DateTime.now()))
              .collection(FirebaseNamesShopSide.bookingDetailsCollection)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            List<DocumentSnapshot> pendingDocs = [];
            List<DocumentSnapshot> completedDocs = [];
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
              DateTime parsedTime =
                  DateFormat("yyyy-MM-dd hh:mm a").parse(combinedTimeString);

              if (currentTime.isBefore(parsedTime)) {
                pendingDocs.add(doc);
              } else {
                completedDocs.add(doc);
              }
            }

            return Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: myFont("BOOKINGS",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.023, context),
                      fontWeight: FontWeight.normal,
                      fontColor: whiteColor),
                ),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: mediaqueryWidth(0.104, context),
                    ),
                    Column(
                      children: [
                        myFont(
                            (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty ||
                                    completedDocs.isEmpty)
                                ? "0"
                                : completedDocs.length.toString(),
                            fontFamily: bebasNeue,
                            fontSize: mediaqueryHeight(0.05, context),
                            fontWeight: FontWeight.normal,
                            fontColor: cyanColor),
                        myFont("Completed",
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.022, context),
                            fontWeight: FontWeight.normal,
                            fontColor: whiteColor)
                      ],
                    ),
                    SizedBox(
                      width: mediaqueryWidth(0.104, context),
                    ),
                    Container(
                      width: 2,
                      height: mediaqueryHeight(0.12, context),
                      decoration: BoxDecoration(color: greyColor3),
                    ),
                    SizedBox(
                      width: mediaqueryWidth(0.14, context),
                    ),
                    Column(
                      children: [
                        myFont(
                            (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty ||
                                    pendingDocs.isEmpty)
                                ? "0"
                                : pendingDocs.length.toString(),
                            fontFamily: bebasNeue,
                            fontSize: mediaqueryHeight(0.05, context),
                            fontWeight: FontWeight.normal,
                            fontColor: cyanColor),
                        myFont("Pendings",
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.022, context),
                            fontWeight: FontWeight.normal,
                            fontColor: whiteColor)
                      ],
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
