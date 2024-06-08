import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/screens/login.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/utils/snackbar.dart';

class ChangePasswordStateHandler{
  static void handleState(BuildContext context, ForgetPasswordState state) {
    if (state is PasswordUpdationFailed) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(errorSnackBar("something went wrong"));
          }
          if (state is PasswordUpdationSuccessfull) {
            Navigator.pop(context);

            Navigator.of(context).pushAndRemoveUntil(
                NoTransitionPageRoute(child: LoginScreen()), (route) => false);
            ScaffoldMessenger.of(context)
                .showSnackBar(successSnackBar("password updated"));
          }
          if (state is NetworkError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(networkErrorSnackbar(context));
          }
  }
}