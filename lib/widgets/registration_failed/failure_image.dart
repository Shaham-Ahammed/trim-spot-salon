import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class FailureImage extends StatelessWidget {
  const FailureImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      
      },
      child: Image.asset(
        "assets/images/registraion denied.png",
        width: mediaqueryWidth(0.7, context),
      ),
    );
  }
}
