
  import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

subtitleText(BuildContext context) {
   return myFont("Good to see you here again.",
        fontFamily: cabinCondensed,
        fontSize: mediaqueryHeight(0.021, context),
        fontWeight: FontWeight.w500,
        fontColor: Colors.blueGrey.shade100);
  }

  welcomeBackText(BuildContext context) {
  return  myFont("WELCOME BACK !",
        fontFamily: cabinCondensed,
        fontSize: mediaqueryHeight(0.0385, context),
        fontWeight: FontWeight.bold,
        fontColor: whiteColor);
  }