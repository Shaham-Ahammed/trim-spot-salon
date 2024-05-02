import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class appBarShopManagement extends StatelessWidget {
  const appBarShopManagement({
    super.key,
    this.fromDrawer = false,
  });
  final bool fromDrawer;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: mediaqueryHeight(0.038, context)),
        height: mediaqueryHeight(0.2, context),
        decoration: BoxDecoration(color: appBarColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            fromDrawer
                ? IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: greyColor,
                      size: mediaqueryHeight(0.027, context),
                    ))
                : Container(),
            Center(
              child: myFont("SHOP MANAGEMENT",
                  fontFamily: cabinCondensed,
                  fontSize: mediaqueryHeight(0.03, context),
                  fontWeight: FontWeight.bold,
                  fontColor: whiteColor),
            ),
            fromDrawer
                ? Container(
                    width: mediaqueryWidth(.06, context),
                  )
                : Container(),
          ],
        ));
  }
}
