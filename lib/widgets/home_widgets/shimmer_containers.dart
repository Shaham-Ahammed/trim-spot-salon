
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class ShimmerEffectPageViewContainersInHome extends StatelessWidget {
  const ShimmerEffectPageViewContainersInHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyColor3,
      highlightColor: greyColor,
      child: Container(
        width: double.infinity,
        height: mediaqueryHeight(0.2, context),
        color: greyColor3,
      ),
    );
  }
}
