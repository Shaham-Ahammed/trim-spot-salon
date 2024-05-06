  import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
  
  

  valueOfPendings(String bookingValue, BuildContext context) {
    return Text(
    bookingValue,
    textAlign: TextAlign.start,
    style: TextStyle(
    
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.02, context),
        fontWeight: FontWeight.w500,
        color: whiteColor),
  );
  }

  colons(BuildContext context) {
    return myFont(":",
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.02, context),
        fontWeight: FontWeight.w500,
        fontColor: whiteColor);
  }

  fieldsOfPendings(BuildContext context, String heading) {
    return myFont(heading,
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.02, context),
        fontWeight: FontWeight.w500,
        fontColor: whiteColor);
  }