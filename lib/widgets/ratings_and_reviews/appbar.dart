import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
class AppBarReviewsAndRatings extends StatelessWidget {
  const AppBarReviewsAndRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: mediaqueryHeight(0.038, context)),
        height: mediaqueryHeight(0.2, context),
        decoration: BoxDecoration(color: appBarColor),
        child: Center(
          child: ListTile(
            horizontalTitleGap: mediaqueryHeight(0.022, context),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: whiteColor,
            ),
            title: myFont("REVIEWS & RATINGS",
                fontFamily: cabinCondensed,
                fontSize: mediaqueryHeight(0.03, context),
                fontWeight: FontWeight.w600,
                fontColor: whiteColor),
          ),
        ));
  }
}