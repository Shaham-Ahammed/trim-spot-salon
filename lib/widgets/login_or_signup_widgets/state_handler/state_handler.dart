import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/screens/login.dart';
import 'package:trim_spot_barber_side/screens/signup.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';

class LoginOrSignUpStateHandler{
  static void handleState(BuildContext context,OnboardindBlocState state){
    if (state is NavigateToLogin) {
              Navigator.of(context)
                  .push(FadeTransitionPageRoute(child: const LoginScreen()));
            }
            if (state is NavigateToSignUp) {
              Navigator.of(context)
                  .push(FadeTransitionPageRoute(child: const SignUpScreen()));
            }
  }
}