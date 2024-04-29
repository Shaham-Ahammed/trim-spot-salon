import 'package:flutter/material.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
class UpiIdTextFormField extends StatelessWidget {
  const UpiIdTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cyanColor, width: 2)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: TextStyle(
                  fontFamily: balooChettan, color: greyColor2, fontSize: 18),
              cursorColor: cyanColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    vertical: mediaqueryHeight(0.015, context),
                    horizontal: mediaqueryWidth(0.06, context)),
                hintStyle: TextStyle(
                    fontFamily: balooChettan, color: greyColor2, fontSize: 18),
                hintText: "UPI id",
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green.shade500,
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: myFont("verify",
                  fontFamily: balooChettan,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontColor: whiteColor),
            ),
          ),
          SizedBox(
            width: mediaqueryWidth(0.03, context),
          ),
        ],
      ),
    );
  }
}

