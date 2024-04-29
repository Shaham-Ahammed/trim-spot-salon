import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/on_boarding.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/curved_contianer.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/images.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/smoothanimation.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/title_and_description.dart';
import 'login_or_signup.dart';

class FirstIntroductionPage extends StatelessWidget {
  FirstIntroductionPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardindBloc, OnboardindBlocState>(
      listener: (context, state) {
        if (state is NavigateToSecondOnBoardingPage) {
          onBoardingPageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        }
        if (state is NavigateToLoginOrSignupPage) {
          Navigator.of(context).push(FadeTransitionPageRoute(
            child: const LoginOrSignup(),
         
          ));
        }
      },
      child: Scaffold(
          bottomSheet: SmoothPageIndincatorAndNextButton(
              pageController: onBoardingPageController, controller: onBoardingItemscontroller),
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
