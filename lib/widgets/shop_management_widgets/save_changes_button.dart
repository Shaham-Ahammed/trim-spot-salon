import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: submitButtonCyan(context, text: "save changes", function: () {
      context
          .read<ShopManagementSaveButtonBloc>()
          .add(SaveChangesButtonPressed(context: context));
      return null;
    },
            heigh: mediaqueryHeight(0.05, context),
            width: mediaqueryWidth(0.5, context),
            fontSize: mediaqueryHeight(0.024, context)));
  }
}
