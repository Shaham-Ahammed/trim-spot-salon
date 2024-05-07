// login_state_handler.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/bottom_navigation_bloc/bottom_navigation_bar_bloc.dart';
import 'package:trim_spot_barber_side/blocs/login_button_bloc/login_validation_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/login_page/login_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/error_snackbars.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/utils/splash_screen/screen_decision.dart';

class LoginStateHandler {
  static void handleState(BuildContext context, LoginValidationState state) {
   if (state is LoginLoadingState) {
            loadingIndicator(context);
          }
          if (state is NetworkError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(networkErrorSnackbar(context));
          }
          if (state is LoginFailure) {
            if (state.exception == "incorrect password") {
              loginPasswordController.clear();
            }
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(errorSnackBar(state.exception));
          }
          if (state is LoginSuccess) {
            Navigator.pop(context);
              context
                            .read<BottomNavigationBarBloc>()
                            .add(BottomNavItemPressed(page: 0));
            context
                .read<UserDetailsBloc>()
                .add(FetchingUserDetailsFromSplash());
           
            checkTheRegistrationStatus(loginPhoneController.text, context);
          }
  }
}
