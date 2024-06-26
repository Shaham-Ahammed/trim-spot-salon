import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/profile_password_bloc/profile_password_bloc.dart';
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
      style: const TextStyle(color: whiteColor),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your new password";
        } else if (value.length < 8) {
          return "must contain atleast 8 characters";
        }
        return null;
      },
      obscureText: context.watch<ProfilePasswordBloc>().state.obscureText,
      decoration: InputDecoration(
          labelStyle: TextStyle(
            color: greyColor3,
            fontSize: mediaqueryHeight(0.02, context),
            fontFamily: balooChettan,
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: cyanColor)),
          border: const OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(horizontal: mediaqueryWidth(0.04, context)),
          labelText: 'New Password',
          suffixIcon: GestureDetector(onTap: () {
            context.read<ProfilePasswordBloc>().add(PressedEyeIconOnPassword());
          }, child: BlocBuilder<ProfilePasswordBloc, ProfilePasswordState>(
            builder: (context, state) {
              return state.obscureText
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility);
            },
          ))),
    );
  }
}
