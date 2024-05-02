import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/logout_alert.dart';

Container profileAppBar(BuildContext context, bool fromDrawer) {
  return Container(
      padding: EdgeInsets.only(top: mediaqueryHeight(0.038, context)),
      height: mediaqueryHeight(0.2, context),
      decoration: BoxDecoration(color: appBarColor),
      child: Row(
        children: [
          fromDrawer
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: greyColor,
                    size: mediaqueryHeight(0.027, context),
                  ))
              : Container(),
          Expanded(
            child: Align(
              alignment: Alignment(
                  fromDrawer
                      ? mediaqueryWidth(-0.00015, context)
                      : mediaqueryWidth(0.00037, context),
                  0),
              child: myFont("PROFILE",
                  fontFamily: cabinCondensed,
                  fontSize: mediaqueryHeight(0.03, context),
                  fontWeight: FontWeight.bold,
                  fontColor: whiteColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              logoutConfirmation(context);
            },
            child: Icon(
              Icons.logout_outlined,
              color: cyanColor,
              size: mediaqueryHeight(0.035, context),
            ),
          ),
          SizedBox(
            width: mediaqueryWidth(0.02, context),
          )
        ],
      ));
}
