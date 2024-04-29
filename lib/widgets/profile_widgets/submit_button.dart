
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: submitButtonCyan(context,
            text: "Save Changes",
            fontSize: mediaqueryHeight(0.02, context),
            heigh: mediaqueryHeight(0.04, context),
            width: mediaqueryWidth(0.35, context), function: () {
      return null;
    }));
  }
}