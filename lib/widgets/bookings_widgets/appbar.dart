import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/bookings.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

  AppBar appBar(BuildContext context) {
    return AppBar(
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

