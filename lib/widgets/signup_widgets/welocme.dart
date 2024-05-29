 import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

welcomeText(context) {
   return myFont("welcome",
        fontFamily: cabinCondensed,
       fontSize: mediaqueryHeight(0.049, context),
        fontWeight: FontWeight.w600,
        fontColor: whiteColor);
  }