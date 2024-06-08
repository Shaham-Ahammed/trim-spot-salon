import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/eye_button_bloc/eye_button_on_new_password_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/controller.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/textformfields.dart';

class ConfirmNewPasswordTextField extends StatelessWidget {
  const ConfirmNewPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
        obscureText: true,
        hintText: "confirm password",
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter confirm password";
          } else if (value !=
              forgotPasswordNewPasswordController.text) {
            return "password mismatch";
          }
          return null;
        },
        controller: forgotPasswordConfirmPasswordController);
  }
}

class NewPasswordTextField extends StatelessWidget {
  const NewPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: forgotPasswordNewPasswordController,
      validator: (value) {
        if (value == "") {
          return "enter password";
        } else if (value!.length < 8) {
          return "password must atleast contain 8 characters";
        } else {
          return null;
        }
      },
      style: TextStyle(
          fontFamily: balooChettan,
          color: greyColor2,
          fontSize: mediaqueryHeight(0.024, context)),
      obscureText: context
          .watch<EyeButtonOnNewPasswordBloc>()
          .state
          .isVisible,
      cursorColor: cyanColor,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(onTap: () {
          context
              .read<EyeButtonOnNewPasswordBloc>()
              .add(EyeButtonPressed());
        }, child: BlocBuilder<EyeButtonOnNewPasswordBloc,
            EyeButtonOnNewPasswordState>(
          builder: (context, state) {
            return state.isVisible
                ? const Icon(
                    Icons.visibility_off,
                    color: greyColor3,
                  )
                : const Icon(Icons.visibility,
                    color: greyColor3);
          },
        )),
        errorStyle: const TextStyle(
          fontSize: 13,
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
                width: 2, color: Colors.red.shade900)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
                width: 2, color: Colors.red.shade900)),
        counterText: "",
        filled: true,
        fillColor: Colors.black54,
        errorMaxLines: 2,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide:
                const BorderSide(width: 2, color: cyanColor)),
        prefix: Padding(
            padding: EdgeInsets.only(
                left: mediaqueryWidth(0.02, context))),
        contentPadding: EdgeInsets.symmetric(
            vertical: mediaqueryHeight(0.015, context),
            horizontal: mediaqueryWidth(0.04, context)),
        hintStyle: TextStyle(
            fontFamily: balooChettan,
            color: greyColor,
            fontSize: mediaqueryHeight(0.024, context)),
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 2, color: cyanColor),
            borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
