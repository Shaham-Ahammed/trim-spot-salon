
  import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_texts/customer_support.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

heading(BuildContext context) {
   return myFont("Customer support",
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.025, context),
        fontWeight: FontWeight.normal,
        fontColor: greyColor2);
  }

  customerSupporText() {
  return  myFont(customerSupport,
        fontFamily: balooChettan,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        fontColor: subTitlesTextGrey);
  }