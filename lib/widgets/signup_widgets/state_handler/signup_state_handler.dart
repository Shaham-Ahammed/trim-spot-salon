import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/utils/snackbar.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';

class SignUpStateHandler{
  static void stateHandler(BuildContext context,RegisterButtonState state){
        if (state is LoadingState) {
          loadingIndicator(context);
        }
        if (state is NetworkError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(networkErrorSnackbar(context));
        
        }
        if (state is RegisrationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar("${state.error}"));
          Navigator.pop(context);
        }
        if (state is PhoneNumberAlreadyRegistered) {
          registrationPhoneController.clear();
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar("phone already registered"));
          Navigator.pop(context);
        }
  }
}