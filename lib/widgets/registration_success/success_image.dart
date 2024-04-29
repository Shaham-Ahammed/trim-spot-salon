import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class SuccessImage extends StatelessWidget {
  const SuccessImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        "assets/images/registration success.png",
        width: mediaqueryWidth(0.7, context),
      ),
    );
  }
}
