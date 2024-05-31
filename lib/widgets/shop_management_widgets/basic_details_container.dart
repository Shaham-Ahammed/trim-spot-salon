import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';



class BasicShopDetails extends StatelessWidget {
  const BasicShopDetails({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: mediaqueryHeight(0.01, context)),
      width: mediaqueryWidth(0.8, context),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: greyColor3, blurRadius: 3, offset: Offset(2, 2))
          ],
          color: blackColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16))),
      child: Row(
        children: [
          SizedBox(
            width: mediaqueryWidth(0.05, context),
          ),
          Icon(
            icon,
            color: greyColor,
            size: mediaqueryHeight(0.03, context),
          ),
          SizedBox(
            width: mediaqueryWidth(0.03, context),
          ),
          myFont(text,
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.023, context),
              fontWeight: FontWeight.w500,
              fontColor: greyColor),
        ],
      ),
    );
  }
}
