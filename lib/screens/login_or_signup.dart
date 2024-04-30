import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/screens/login.dart';
import 'package:trim_spot_barber_side/screens/signup.dart';
import 'package:trim_spot_barber_side/screens/splash_screen.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/widgets/login_or_signup_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/login_or_signup_widgets/login_signup_buttons.dart';


class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: BlocListener<OnboardindBloc, OnboardindBlocState>(
          listener: (context, state) {
            if (state is NavigateToLogin) {
              
               Navigator.of(context)
                  .push(NoTransitionPageRoute(child: const SplashScreen()));
              // Navigator.of(context)
              //     .push(FadeTransitionPageRoute(child: const LoginScreen()));
            }
            if (state is NavigateToSignUp) {
              Navigator.of(context)
                  .push(FadeTransitionPageRoute(child: const SignUpScreen()));
            }
          },
          child: Stack(
            children: [
              const BackgroundImage(),
              loginPageButtons(
                  context: context,
                  left: 0.07,
                  text: "LOGIN",
                  textColor: blackColor,
                  containerColor: cyanColor,
                  borderColor: cyanColor,
                  function: () =>
                      context.read<OnboardindBloc>().add(LoginButtonPressed()
               ) ),
              loginPageButtons(
                  context: context,
                  left: 0.53,
                  text: "SIGNUP",
                  textColor: whiteColor,
                  containerColor: transparentColor,
                  borderColor: whiteColor,
                  function: () =>
                      context.read<OnboardindBloc>().add(SignUpButtonPressed()))
            ],
          ),
        ),
      ),
    );
  }
}
