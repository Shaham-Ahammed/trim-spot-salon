import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/models/introduction_lists.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class SmoothPageIndincatorAndNextButton extends StatelessWidget {
  const SmoothPageIndincatorAndNextButton({
    super.key,
    required this.pageController,
    required this.controller,
  });

  final PageController pageController;
  final InroductionItems controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: mediaqueryWidth(0.11, context),
          right: mediaqueryWidth(0.11, context),
          bottom: mediaqueryHeight(0.09, context)),
      color: introductionColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: pageController,
            count: controller.items.length,
            effect: ExpandingDotsEffect(
                radius: mediaqueryHeight(0.02, context),
                dotWidth: mediaqueryHeight(0.02, context),
                dotHeight: mediaqueryHeight(0.02, context),
                activeDotColor: cyanColor),
          ),
          SizedBox(width: mediaqueryWidth(0.33, context)),
          InkWell(
            onTap: () {
              context
                  .read<OnboardindBloc>()
                  .add(NextButtonPressed(pageController.page!));
            },
            child: Container(
              width: mediaqueryWidth(0.16, context),
              height: mediaqueryWidth(0.15, context),
              decoration: BoxDecoration(
                  color: cyanColor, borderRadius: BorderRadius.circular(12)),
              child:  Icon(Icons.arrow_forward_ios_rounded,size: mediaqueryHeight(0.036, context),),
            ),
          )
        ],
      ),
    );
  }
}
