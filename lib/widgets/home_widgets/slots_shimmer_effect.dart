import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';

import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class SlotsInShimmerEffect extends StatelessWidget {
  const SlotsInShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: mediaqueryWidth(0.029, context)),
      child: Shimmer.fromColors(
          baseColor: greyColor3,
          highlightColor: appBarColor,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (22 / 4).ceil(),
            itemBuilder: (BuildContext context, int index) {
              int startIndex = index * 4;
              int endIndex = startIndex + 4 > 22 ? 22 : startIndex + 4;

              return Padding(
                padding: EdgeInsets.only(top: mediaqueryHeight(0.02, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(4, (index) {
                    int itemIndex = startIndex + index;
                    if (itemIndex < endIndex) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left:
                              index == 0 ? 0 : mediaqueryHeight(0.014, context),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {},
                          child: Container(
                            height: mediaqueryHeight(0.045, context),
                            width: mediaqueryWidth(0.19, context),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(color: greyColor),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(width: mediaqueryWidth(0.19, context));
                    }
                  }),
                ),
              );
            },
          )),
    );
  }
}
