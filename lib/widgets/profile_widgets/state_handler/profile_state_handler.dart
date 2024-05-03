import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/profile_save_button_bloc/profile_save_button_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';

class ProfileStateHandler {
  static void handleState(BuildContext context, ProfileSaveButtonState state) {
    if (state is ProfileUpdating) {
      loadingIndicator(context);
    }
    if (state is ProfileUpdationFinished) {
      context.read<ProfileUserImageBloc>().add(FetchUserProfileImage());
      context.read<ProfileShopImageBloc>().add(FetchShopImage());
      context.read<UserDetailsBloc>().add(FetchingUserDetailsFromSplash());

      context
          .read<ProfileNameBloc>()
          .add(NameEditButtonPressed(editPressed: false));
      context
          .read<ProfileEmailBloc>()
          .add(EmailEditButtonPressed(editPressed: false));

      profilePhoneController.text =
          context.watch<UserDetailsBloc>().state.phone;
      profileNameController.text =
          context.watch<UserDetailsBloc>().state.userName;
      profileEmailController.text =
          context.watch<UserDetailsBloc>().state.email;
    }

    if (state is NetworkErrorWhileUpdatingProfile) {
      ScaffoldMessenger.of(context).showSnackBar(networkErrorSnackbar(context));
    }
  }
}
