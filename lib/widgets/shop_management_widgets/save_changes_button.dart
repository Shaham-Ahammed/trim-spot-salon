import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/confirm_changes_alert.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: submitButtonCyan(context, text: "save changes", function: () {
      saveChangesAlert(context);

      return null;
    },
            inkwellColor: cyanColor,
            heigh: mediaqueryHeight(0.042, context),
            width: mediaqueryWidth(0.36, context),
            fontSize: mediaqueryHeight(0.02, context)));
  }
}
