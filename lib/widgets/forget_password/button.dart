import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

sendOtpButton(BuildContext context) {
  return submitButtonCyan(
    context,
    text: "send otp",
    fontSize: mediaqueryHeight(0.023, context),
    heigh: mediaqueryHeight(0.055, context),
    width: mediaqueryWidth(0.5, context),
    function: () {
      context
          .read<ForgetPasswordBloc>()
          .add(SendOtpButtonPressed(context: context));
      return null;
    },
  );
}
