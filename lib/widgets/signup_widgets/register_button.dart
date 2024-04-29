// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/registration_page/cyan_container.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: cyanColor,
        borderRadius: BorderRadius.circular(90),
        child: InkWell(
          onTap: () {
            context
                .read<RegisterButtonBloc>()
                .add(RegisterButtonPressed(context: context));
          },
          borderRadius: BorderRadius.circular(90),
          child: Container(
            width: mediaqueryWidth(0.6, context),
            height: mediaqueryHeight(0.06, context),
            decoration: cyanContainer(transparentColor),
            child: Center(
              child: myFont("Register",
                  fontFamily: balooChettan,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontColor: blackColor),
            ),
          ),
        ));
  }
}
