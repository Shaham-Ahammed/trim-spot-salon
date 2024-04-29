import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';

import 'package:trim_spot_barber_side/utils/homepage/animation_control.dart';

class SmoothPageIndicatorHomeScreen extends StatelessWidget {
  const SmoothPageIndicatorHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: homePageController,
      count: 2,
      effect: const ColorTransitionEffect(
          activeDotColor: cyanColor,
      
          dotWidth: 8,
          dotHeight: 8),
    );
  }
}
