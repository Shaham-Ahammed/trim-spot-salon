import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/screens/change_password_screen.dart';
import 'package:trim_spot_barber_side/screens/registration_successful.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/utils/snackbar.dart';

class ForgetPasswordOtpPageStateHandler {
  static void handleState(BuildContext context, ForgetPasswordState state) {
    if (state is NavigateToRegisterSuccessPage) {
      Navigator.pop(context);
      Navigator.of(context).pushAndRemoveUntil(
        FadeTransitionPageRoute(child: RegistrationSuccessfulMessageScreen()),
        (route) => false,
      );
      if (state is OtpVerificationFailed) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(errorSnackBar("Incorrect OTP"));
      }
      if (state is OtpVerfied) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(
            FadeTransitionPageRoute(child: ChangePasswordScreen()));
      }
    
    }
  }
}
