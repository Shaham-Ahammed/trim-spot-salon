import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';


class TodaysBookingsHeading extends StatelessWidget {
  const TodaysBookingsHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: myFont("TODAYS BOOKINGS",
            fontFamily: cabinCondensed,
            fontSize: mediaqueryHeight(0.025, context),
            fontWeight: FontWeight.w500,
            fontColor: whiteColor));
  }
}
