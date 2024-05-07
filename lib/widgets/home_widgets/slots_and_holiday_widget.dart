import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/functions/holiday_checker.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/lock_slots_button.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/slots.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/slots_shimmer_effect.dart';
import 'package:lottie/lottie.dart';

class SlotsAndHolidayWidget extends StatelessWidget {
  const SlotsAndHolidayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: holidaychecking(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return SlotsInShimmerEffect();
        }
        if (snapshot.data!) {
          return Center(
              child: LottieBuilder.asset(
            "assets/animations/shop_closed 1.json",
            height: mediaqueryHeight(0.4, context),
          ));
        }
        return Column(
          children: [
            SlotTiles(),
            SizedBox(
              height: mediaqueryHeight(0.023, context),
            ),
            LockSlotsButton()
          ],
        );
      },
    );
  }
}