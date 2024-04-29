import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_texts/registration_failed.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class RegistrationFailureMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: balooChettan,
          color: whiteColor,
          fontSize: mediaqueryHeight(0.02, context),
        ),
        children: <TextSpan>[
          TextSpan(
            text: deniedText,
            style: TextStyle(
              fontFamily: balooChettan,
              color: Colors.red.shade700,
              fontSize: mediaqueryHeight(0.02, context),
            ),
          ),
          TextSpan(text: registrationDeniedText),
        ],
      ),
    );
  }
}
