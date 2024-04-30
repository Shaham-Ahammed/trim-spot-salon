 import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';

  class AppLogo extends StatelessWidget {
  const AppLogo({
    required this.size,
    super.key,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        logoTrim(context, size),
        logoSpot(context, size),
      ],
    );
  }
}

logoSpot(BuildContext context,double size) {
   return myFont("SPOT",
                        fontFamily: bebasNeue,
                        fontSize: size,
                        fontWeight: FontWeight.normal,
                        fontColor: cyanColor);
  }

  logoTrim(BuildContext context,double size) {
 return   myFont("TRIM",
                        fontFamily: bebasNeue,
                        fontSize: size,
                        fontWeight: FontWeight.normal,
                        fontColor: whiteColor);
  }


