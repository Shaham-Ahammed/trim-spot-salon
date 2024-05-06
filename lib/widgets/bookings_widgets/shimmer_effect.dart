import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class ShimmerEffectBookingsPage extends StatelessWidget {
  const ShimmerEffectBookingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          direction: ShimmerDirection.rtl,
          baseColor: greyColor3,
          highlightColor: greyColor,
          child: Padding(
            padding: EdgeInsets.only(bottom: mediaqueryHeight(0.025, context)),
            child: Container(
              height: mediaqueryHeight(0.1, context),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Color.fromARGB(255, 54, 54, 54),
                  border: Border.all(color: greyColor3, width: 1),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        );
      },
      itemCount: 5,
    );
  }
}
