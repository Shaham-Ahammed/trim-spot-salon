import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';

class NewPasswordTextFormField extends StatelessWidget {
  const NewPasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: profileNewPasswordController,
      cursorColor: greyColor,
      style: TextStyle(color: whiteColor),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your new password";
        } else if (value.length < 8) {
          return "must contain atleast 8 characters";
        }
        return null;
      },
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
        labelText: 'New Password',
      ),
    );
  }
}
