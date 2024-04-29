import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

submitButtonOtpPage(BuildContext context, String verificationId) {
  return submitButtonCyan(context, function: () {
    context.read<RegisterButtonBloc>().add(SubmitOtpButtonPressed(context,
        verificationId: verificationId));
    return null;
  },
      heigh: mediaqueryHeight(0.06, context),
      text: "submit",
      width: mediaqueryWidth(0.5, context));
}
