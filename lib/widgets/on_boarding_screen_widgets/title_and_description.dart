
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/models/introduction_lists.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';


class OnBoardingDescription extends StatelessWidget {
  const OnBoardingDescription({
    super.key,
    required this.controller,
    required this.index,
  });

  final InroductionItems controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: mediaqueryHeight(0.168, context),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: mediaqueryWidth(0.1, context)),
          child: myFont(controller.items[index].subtitle,
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.018, context),
              fontWeight: FontWeight.normal,
              fontColor: greyColor),
        ));
  }
}

class OnBoardingTitle2 extends StatelessWidget {
  const OnBoardingTitle2({
    super.key,
    required this.controller,
    required this.index,
  });

  final InroductionItems controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: mediaqueryWidth(0.1, context),
        bottom: mediaqueryHeight(0.25, context),
        child: myFont(controller.items[index].title2,
            fontFamily: b612,
            fontSize: mediaqueryHeight(0.03, context),
            fontWeight: FontWeight.bold,
            fontColor: cyanColor));
  }
}

class OnBoardingTitle extends StatelessWidget {
  const OnBoardingTitle({
    super.key,
    required this.controller,
    required this.index,
  });
  final int index;
  final InroductionItems controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: mediaqueryWidth(0.1, context),
        bottom: mediaqueryHeight(0.3, context),
        child: myFont(controller.items[index].title,
            fontFamily: b612,
            fontSize:  mediaqueryHeight(0.03, context),
            fontWeight: FontWeight.bold,
            fontColor: whiteColor));
  }
}