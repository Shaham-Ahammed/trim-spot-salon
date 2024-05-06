import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class NoReviewsYetIllustration extends StatelessWidget {
  const NoReviewsYetIllustration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no review.png",
            height: mediaqueryHeight(0.34, context),
          ),
          myFont("no reviews yet",
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.022, context),
              fontWeight: FontWeight.w500,
              fontColor: whiteColor)
        ],
      ),
    );
  }
}
