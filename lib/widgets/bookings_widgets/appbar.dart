import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/bookings.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

AppBar appBar(BuildContext context, bool fromDrawer) {
  return AppBar(
    leading: fromDrawer
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: greyColor,
              size: mediaqueryHeight(0.027, context),
            ))
        : Container(),
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: myFont("BOOKINGS",
        fontFamily: cabinCondensed,
        fontSize: mediaqueryHeight(0.03, context),
        fontWeight: FontWeight.bold,
        fontColor: whiteColor),
    backgroundColor: appBarColor,
    bottom: TabBar(
      controller: tabController,
      tabs: myTabs,
      labelColor: cyanColor,
      unselectedLabelColor: whiteColor,
      indicatorColor: cyanColor,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );
}
