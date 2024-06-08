import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/screens/change_password_screen.dart';
import 'package:trim_spot_barber_side/screens/forget_pass_otp_screen.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/utils/snackbar.dart';

class ForgetPasswordStateHandler {
  static void handleState(BuildContext context, ForgetPasswordState state) {
    if (state is LoadingIndicatorOnForgotPassword) {
      loadingIndicator(context);
    }
    if (state is PhoneNumberNotRegistered) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar("phone number not registered"));
    }
    if (state is NetworkError) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(networkErrorSnackbar(context));
    }
    if (state is NavigateToVerfiyOtpPage) {
      Navigator.pop(context);
      Navigator.of(context).push(
          FadeTransitionPageRoute(child: ForgetPassOtpVerificationScreen()));
    }
    if (state is OtpVerfied) {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
          FadeTransitionPageRoute(child: ChangePasswordScreen()));
    }
  }
}
