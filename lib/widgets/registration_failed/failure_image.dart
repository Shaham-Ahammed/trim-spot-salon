import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/bottom_navigation.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';

class FailureImage extends StatelessWidget {
  const FailureImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(NoTransitionPageRoute(child: BottomNavigationScreen()));
      },
      child: Image.asset(
        "assets/images/registraion denied.png",
        width: mediaqueryWidth(0.7, context),
      ),
    );
  }
}
