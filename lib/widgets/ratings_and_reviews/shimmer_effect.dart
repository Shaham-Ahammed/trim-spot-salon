import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
class ShimmerOfReviewsLoading extends StatelessWidget {
  const ShimmerOfReviewsLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyColor3,
      highlightColor: greyColor,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index != 0)
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: mediaqueryHeight(0.03, context),
                    ),
                    SizedBox(
                      width: mediaqueryWidth(0.04, context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: mediaqueryWidth(0.35, context),
                          height: mediaqueryHeight(0.02, context),
                          color: greyColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(5, (index) {
                            return Icon(Icons.star_rate_rounded,
                                color: Colors.grey,
                                size: mediaqueryHeight(0.023, context));
                          }),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                Container(
                  height: mediaqueryHeight(0.06, context),
                  width: double.infinity,
                  color: greyColor,
                ),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                Divider(
                  thickness: 1,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
