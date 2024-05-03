import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';
import 'package:trim_spot_barber_side/utils/error_snackbars.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';

class ShopManagementStateHandler {
  static void handlerState(
      BuildContext context, ShopManagementSaveButtonState state) {
    if (state is ShopMangaementLoadingIndicator) {
      loadingIndicator(context);
    }
    if (state is ErrorInUpdation) {
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar(state.exception));
    }
    if (state is NetworkError) {
      ScaffoldMessenger.of(context).showSnackBar(networkErrorSnackbar(context));
    }
  }
}
