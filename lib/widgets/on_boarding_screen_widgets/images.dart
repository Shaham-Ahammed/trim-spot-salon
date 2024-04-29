
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/models/introduction_lists.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';



class BoardingScreenImages extends StatelessWidget {
  const BoardingScreenImages(
      {super.key, required this.controller, required this.index});
  final int index;
  final InroductionItems controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Align(
        alignment: Alignment.topCenter,
        child: Transform.scale(
          scale: 1.3,
          child: Image.asset(
              filterQuality: FilterQuality.high,
              height: mediaqueryHeight(0.6, context),
              width: double.infinity,
              fit: BoxFit.cover,
              controller.items[index].imagePath),
        ),
      ),
    );
  }
}
