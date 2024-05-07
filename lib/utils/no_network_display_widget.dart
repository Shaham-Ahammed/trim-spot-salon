
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class NoNetworkDisplayWidget extends StatelessWidget {
  const NoNetworkDisplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/no internet 4.png",
            height: mediaqueryHeight(0.25, context),
          ),
        ),
        SizedBox(
          height: mediaqueryHeight(0.02, context),
        ),
        myFont("SOMETHING WENT WRONG",
            fontFamily: belleza,
            fontSize: mediaqueryHeight(0.018, context),
            fontWeight: FontWeight.w600,
            fontColor: whiteColor),
        SizedBox(
          height: mediaqueryHeight(0.01, context),
        ),
        myFont("please check your network connectivity.",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.016, context),
            fontWeight: FontWeight.w400,
            fontColor: whiteColor),
      ],
    );
  }
}
