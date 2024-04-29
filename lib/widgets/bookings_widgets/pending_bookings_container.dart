import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/bookings.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/bookings_widgets/booking_detais_font.dart';
  Container pedningDetailsContainer(BuildContext context, int index) {
    return Container(
              padding: EdgeInsets.symmetric(
                  vertical: mediaqueryHeight(0.01, context),
                  horizontal: mediaqueryWidth(0.03, context)),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      pendingsDetails(
                          context, "${datas[0]}                :"),
                      pendingsDetails(context,
                          "   ${bookingCompletedDetails[index].name}"),
                    ],
                  ),
                  Row(
                    children: [
                      pendingsDetails(
                          context, "${datas[1]}                  :"),
                      pendingsDetails(context,
                          "   ${bookingCompletedDetails[index].time}"),
                    ],
                  ),
                  Row(
                    children: [
                      pendingsDetails(context, "${datas[2]}           :"),
                      pendingsDetails(context,
                          "   ${bookingCompletedDetails[index].services}"),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Color.fromARGB(255, 54, 54, 54),
                  border: Border.all(color: greyColor3, width: 1),
                  borderRadius: BorderRadius.circular(12)),
            );
  }
