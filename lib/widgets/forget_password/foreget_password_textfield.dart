import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/controller.dart';
import 'package:trim_spot_barber_side/utils/textformfields.dart';

class ForgetPasswordTextField extends StatelessWidget {
  const ForgetPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      hintText: "phone",
      filteringTextInputFormatter: FilteringTextInputFormatter.digitsOnly,
      textInputType: TextInputType.phone,
      maxLenght: 10,
      controller: forgotPasswordPhoneController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        if (value.length < 10) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }
}
