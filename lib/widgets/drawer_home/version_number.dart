import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

versionNumber(BuildContext context) {
  return  myFont("VERSION 1.0.0",
                    fontFamily: b612,
                    fontSize: mediaqueryHeight(0.015, context),
                    fontWeight: FontWeight.bold,
                    fontColor: greyColor3);
  }
