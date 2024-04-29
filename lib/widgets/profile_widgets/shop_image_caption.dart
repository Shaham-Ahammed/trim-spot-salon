
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

 
  shopImageCaption(BuildContext context) {
    return myFont(
        "( This image will be seen by clients as a reference to your shop )",
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.013, context),
        fontWeight: FontWeight.normal,
        fontColor: greyColor3);
  }