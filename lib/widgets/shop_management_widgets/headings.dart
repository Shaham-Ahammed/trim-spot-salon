import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

shopManagementHeadings(BuildContext context, String heading) {
  return Column(
    children: [
      myFont(heading,
          fontFamily: balooChettan,
          fontSize: mediaqueryHeight(0.023, context),
          fontWeight: FontWeight.w700,
          fontColor: greyColor2),
      SizedBox(
        height: mediaqueryHeight(0.015, context),
      )
    ],
  );
}

shopImageHeading(BuildContext context) {
  return myFont("Shop Image",
      fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.023, context),
      fontWeight: FontWeight.w700,
      fontColor: greyColor2);
}
