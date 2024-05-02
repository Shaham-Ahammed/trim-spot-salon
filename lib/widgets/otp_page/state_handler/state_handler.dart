import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/screens/registration_successful.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';

class OtpStateHandler {
  static void handleState(BuildContext context, RegisterButtonState state) {
    if (state is NavigateToRegisterSuccessPage) {
      Navigator.pop(context);
      Navigator.of(context).pushAndRemoveUntil(
        FadeTransitionPageRoute(child: RegistrationSuccessfulMessageScreen()),
        (route) => false,
      );
    }
  }
}
