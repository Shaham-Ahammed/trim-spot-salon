import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/widgets/login_or_signup_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/login_or_signup_widgets/login_signup_buttons.dart';

class LoginAndSignUpButtons extends StatelessWidget {
  const LoginAndSignUpButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                context.read<OnboardindBloc>().add(LoginButtonPressed())),
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
    );
  }
}
