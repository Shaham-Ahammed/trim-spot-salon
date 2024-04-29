import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/registration_failed.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';



class SuccessImage extends StatelessWidget {
  const SuccessImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(NoTransitionPageRoute(child: RegistrationFailedMessageScreen())),
      child: Image.asset(
        "assets/images/registration success.png",
        width: mediaqueryWidth(0.7, context),
      ),
    );
  }
}
