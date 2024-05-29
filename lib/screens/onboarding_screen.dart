import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/on_boarding.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/curved_contianer.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/images.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/smoothanimation.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/state_handler/state_handler.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/title_and_description.dart';

class FirstIntroductionPage extends StatelessWidget {
  FirstIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardindBloc, OnboardindBlocState>(
      listener: (context, state) {
        OnBoardingStateHandler.handleState(context, state);
      },
      child: Scaffold(
          backgroundColor: blackColor,
          bottomSheet: SmoothPageIndincatorAndNextButton(
              pageController: onBoardingPageController,
              controller: onBoardingItemscontroller),
          body: PageView.builder(
            controller: onBoardingPageController,
            itemCount: onBoardingItemscontroller.items.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  BoardingScreenImages(
                    controller: onBoardingItemscontroller,
                    index: index,
                  ),
                  const OnBoardingTextAreaContainer(),
                  OnBoardingTitle(
                    controller: onBoardingItemscontroller,
                    index: index,
                  ),
                  OnBoardingTitle2(
                    controller: onBoardingItemscontroller,
                    index: index,
                  ),
                  OnBoardingDescription(
                    controller: onBoardingItemscontroller,
                    index: index,
                  ),
                ],
              );
            },
          )),
    );
  }
}
