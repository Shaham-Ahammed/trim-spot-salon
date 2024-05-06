import 'package:flutter/material.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

noPendings(BuildContext context) {
  return Center(
      child: myFont("no pending bookings till now",
          fontFamily: balooChettan,
          fontSize: mediaqueryHeight(0.022, context),
          fontWeight: FontWeight.w500,
          fontColor: whiteColor));
}

noCompletedOrders(BuildContext context) {
  return Center(
      child: myFont("no orders completed today",
          fontFamily: balooChettan,
          fontSize: mediaqueryHeight(0.022, context),
          fontWeight: FontWeight.w500,
          fontColor: whiteColor));
}
