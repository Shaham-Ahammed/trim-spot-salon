import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class EarningsPageView extends StatelessWidget {
    final String totalEarnings;
  const EarningsPageView(this.totalEarnings,{
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
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: myFont("EARNINGS",
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
                width: mediaqueryWidth(0.146, context),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: CollectionReferences()
                      .shopDetailsReference()
                      .doc(BlocProvider.of<UserDetailsBloc>(context).state.shopId)
                      .collection(FirebaseNamesShopSide.dailyBookingsCollection)
                      .doc(DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString())
                      .collection(
                          FirebaseNamesShopSide.bookingDetailsCollection)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    int total = 0;
                    if (snapshot.data!.docs.isNotEmpty) {
                      for (var docs in snapshot.data!.docs) {
                        int i =
                            int.parse(docs[BookingsDocumentModel.totalAmount]);
                        total += i;
                      }
                    }
                    return Column(
                      children: [
                        myFont(total.toString(),
                            fontFamily: bebasNeue,
                            fontSize: mediaqueryHeight(0.05, context),
                            fontWeight: FontWeight.normal,
                            fontColor: cyanColor),
                        myFont("Todays",
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.022, context),
                            fontWeight: FontWeight.normal,
                            fontColor: whiteColor)
                      ],
                    );
                  }),
              SizedBox(
                width: mediaqueryWidth(0.146, context),
              ),
              Container(
                width: 2,
                height: mediaqueryHeight(0.12, context),
                decoration: BoxDecoration(color: greyColor3),
              ),
              SizedBox(
                width: mediaqueryWidth(0.12, context),
              ),
              Column(
                children: [
               
                       Text(
                        totalEarnings,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: bebasNeue,
                            fontSize: mediaqueryHeight(0.05, context),
                            fontWeight: FontWeight.normal,
                            color: cyanColor),
                      ),
                   
                  myFont("Total",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.022, context),
                      fontWeight: FontWeight.normal,
                      fontColor: whiteColor)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
