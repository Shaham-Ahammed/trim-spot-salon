import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';

class oldPasswordTextField extends StatelessWidget {
  const oldPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: profileOldPasswordController,
      cursorColor: greyColor,
      style: TextStyle(color: whiteColor),
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your current password";
        } else if (value !=
            BlocProvider.of<UserDetailsBloc>(context, listen: false)
                .state
                .password) {
          return "incorrect password";
        }
        return null;
      },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: greyColor3,
          fontSize: mediaqueryHeight(0.02, context),
          fontFamily: balooChettan,
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: cyanColor)),
        border: OutlineInputBorder(),
        contentPadding:
            EdgeInsets.symmetric(horizontal: mediaqueryWidth(0.04, context)),
        labelText: 'Old Password',
      ),
    );
  }
}
