  import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
  
  
  pendingsDetails(BuildContext context, String text) {
    return myFont(text,
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.02, context),
        fontWeight: FontWeight.w500,
        fontColor: whiteColor);
  }