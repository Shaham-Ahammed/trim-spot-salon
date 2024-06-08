import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

saveButtonOnChangePassword(BuildContext context) {
   return submitButtonCyan(context,
                      text: "save",
                      heigh: mediaqueryHeight(0.04, context),
                      width: mediaqueryWidth(0.35, context), function: () {
                    context
                        .read<ForgetPasswordBloc>()
                        .add(SaveNewPasswordButtonPressed());
                    return null;
                  });
  }