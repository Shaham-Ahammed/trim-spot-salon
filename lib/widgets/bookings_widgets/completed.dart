import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/bookings_widgets/texts.dart';

  ListView completedLists(List<DocumentSnapshot<Object?>> filteredDocs) {
    return ListView.builder(
      itemCount: filteredDocs.length,
      itemBuilder: (context, index) {
        final booking = filteredDocs[index];
        return Padding(
          padding: EdgeInsets.only(bottom: mediaqueryHeight(0.025, context)),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: mediaqueryHeight(0.01, context),
                horizontal: mediaqueryWidth(0.03, context)),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: fieldsOfPendings(context, "Name"),
                    ),
                    SizedBox(width: mediaqueryWidth(0.12, context)),
                    colons(context),
                    SizedBox(
                      width: mediaqueryWidth(0.02, context),
                    ),
                    SizedBox(width: mediaqueryWidth(0.02, context)),
                    Container(
                         width: mediaqueryWidth(0.49, context),
                      child: valueOfPendings(booking['name'], context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: fieldsOfPendings(context, "Time"),
                    ),
                    SizedBox(width: mediaqueryWidth(0.137, context)),
                    colons(context),
                    SizedBox(
                      width: mediaqueryWidth(0.02, context),
                    ),
                    SizedBox(width: mediaqueryWidth(0.02, context)),
                    Container(
                      child: valueOfPendings(booking['time'], context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: fieldsOfPendings(context, "Services"),
                    ),
                    SizedBox(width: mediaqueryWidth(0.067, context)),
                    colons(context),
                    SizedBox(
                      width: mediaqueryWidth(0.02, context),
                    ),
                    SizedBox(width: mediaqueryWidth(0.02, context)),
                    Container(
                      width: mediaqueryWidth(0.49, context),
                      child: valueOfPendings(booking['services'], context),
                    ),
                  ],
                ),
              ],
            ),
             decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          color: Color.fromARGB(255, 54, 54, 54),
          border: Border.all(color: cyanColor, width: 0.5),
          borderRadius: BorderRadius.circular(12)),
          ),
        );
      },
    );
  }