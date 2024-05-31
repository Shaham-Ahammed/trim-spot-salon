import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';



class OpeningAndClosingTimeInShopManagement extends StatelessWidget {
  const OpeningAndClosingTimeInShopManagement({
    super.key,
  });

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
          Transform.flip(
            flipX: true,
            child: Icon(
              Icons.schedule,
              color: Colors.blue.shade400,
              size: mediaqueryHeight(0.03, context),
            ),
          ),
          SizedBox(
            width: mediaqueryWidth(0.03, context),
          ),
          myFont(context.watch<UserDetailsBloc>().state.openingTime,
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.023, context),
              fontWeight: FontWeight.w500,
              fontColor: greyColor),
          SizedBox(
            width: mediaqueryWidth(0.03, context),
          ),
          Container(
            height: mediaqueryHeight(0.02, context),
            width: 1,
            color: greyColor,
          ),
          SizedBox(
            width: mediaqueryWidth(0.03, context),
          ),
          Icon(
            Icons.schedule,
            color: Colors.red.shade600,
            size: mediaqueryHeight(0.03, context),
          ),
          SizedBox(
            width: mediaqueryWidth(0.03, context),
          ),
          myFont(context.watch<UserDetailsBloc>().state.closingTime,
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.023, context),
              fontWeight: FontWeight.w500,
              fontColor: greyColor),
        ],
      ),
    );
  }
}