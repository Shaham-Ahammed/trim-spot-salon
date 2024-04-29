import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class appBarShopManagement extends StatelessWidget {
  const appBarShopManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: mediaqueryHeight(0.038, context)),
        height: mediaqueryHeight(0.2, context),
        decoration: BoxDecoration(color: appBarColor),
        child: Center(
          child: myFont("SHOP MANAGEMENT",
              fontFamily: cabinCondensed,
              fontSize: mediaqueryHeight(0.03, context),
              fontWeight: FontWeight.bold,
              fontColor: whiteColor),
        ));
  }
}
