import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_barber_side/utils/login_page/login_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/textformfields.dart';


class PhoneLoginWidget extends StatelessWidget {
  const PhoneLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      maxLenght: 10,
      validator: (value) {
        if (value!.length < 10) {
          return "enter a valid number";
        } else if (value.isEmpty) {
          return "enter your mobile number";
        } else {
          return null;
        }
      },
      controller: loginPhoneController,
      hintText: "phone",
      textInputType: TextInputType.number,
    );
  }
}

class PasswordLoginWidget extends StatelessWidget {
  const PasswordLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validator: (value) {
        if (value!.length < 8) {
          return "password must contain 8 characters";
        } else if (value.isEmpty) {
          return "enter password";
        } else {
          return null;
        }
      } ,
      controller: loginPasswordController,
      hintText: "Password",
      obscureText: true,
    );
  }
}
