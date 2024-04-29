  import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

EdgeInsets bottomNavPadding(BuildContext context) {
    return EdgeInsets.only(
            left: mediaqueryHeight(0.02, context),
            right: mediaqueryHeight(0.02, context),
            bottom: mediaqueryHeight(0.018, context),
            top: mediaqueryHeight(0.012, context));
  }