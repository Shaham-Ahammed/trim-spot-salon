import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/screens/login_or_signup.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/on_boarding.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';

class OnBoardingStateHandler{
  static void handleState(BuildContext context,OnboardindBlocState state){
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
  }
}