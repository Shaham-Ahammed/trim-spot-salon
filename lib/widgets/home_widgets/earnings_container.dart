import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';


class EarningsPageView extends StatelessWidget {
  const EarningsPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: mediaqueryHeight(0.01, context),
          vertical: mediaqueryHeight(0.004, context)),
      decoration: BoxDecoration(color: appBarColor),
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: myFont("EARNINGS",
                fontFamily: balooChettan,
                fontSize: mediaqueryHeight(0.023, context),
                fontWeight: FontWeight.normal,
                fontColor: whiteColor),
          ),
          SizedBox(
            height: mediaqueryHeight(0.02, context),
          ),
          Row(
            children: [
              SizedBox(
                width: mediaqueryWidth(0.146, context),
              ),
              Column(
                children: [
                  myFont("720",
                      fontFamily: bebasNeue,
                      fontSize: mediaqueryHeight(0.05, context),
                      fontWeight: FontWeight.normal,
                      fontColor: cyanColor),
                  myFont("Todays",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.022, context),
                      fontWeight: FontWeight.normal,
                      fontColor: whiteColor)
                ],
              ),
              SizedBox(
                width: mediaqueryWidth(0.146, context),
              ),
              Container(
                width: 2,
                height: mediaqueryHeight(0.12, context),
                decoration: BoxDecoration(color: greyColor3),
              ),
              SizedBox(
                width: mediaqueryWidth(0.12, context),
              ),
              Column(
                children: [
                  myFont("12000",
                      fontFamily: bebasNeue,
                      fontSize: mediaqueryHeight(0.05, context),
                      fontWeight: FontWeight.normal,
                      fontColor: cyanColor),
                  myFont("Monthly",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.022, context),
                      fontWeight: FontWeight.normal,
                      fontColor: whiteColor)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}