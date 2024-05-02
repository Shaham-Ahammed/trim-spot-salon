import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class FetchingLocationScreenMap extends StatelessWidget {
  const FetchingLocationScreenMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFadingCube(
          color: cyanColor,
          size: mediaqueryWidth(0.2, context),
        ),
        SizedBox(
          height: mediaqueryHeight(0.07, context),
        ),
        myFont("fetching your location",
            fontFamily: b612,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontColor: whiteColor)
      ],
    );
  }
}