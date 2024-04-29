import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_texts/registrtion_success_message.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class RegistrationSuccessMessage extends StatelessWidget {
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
          TextSpan(text: registrationSuccessText),
          TextSpan(

            text: successText,
            style: TextStyle(
            fontFamily: balooChettan,
              color: cyanColor, 
              fontSize: mediaqueryHeight(0.02, context), 
            ),
          ),
          TextSpan(text: pendingApprovalText),
        ],
      ),
    );
  }
}