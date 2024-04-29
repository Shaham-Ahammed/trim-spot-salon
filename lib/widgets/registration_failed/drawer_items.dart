import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/registration_success_failure.dart';
import 'package:trim_spot_barber_side/utils/logo.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class AppBarItemsFailed extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHeight(0.2, context),
      decoration: BoxDecoration(color: appBarColor),
      child: Column(
        children: [
          SizedBox(height: mediaqueryHeight(0.06, context)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.05, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: GestureDetector(
                    onTap: () {
                      registrationFailedScaffoldKey.currentState?.openDrawer();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/menu_icon.svg",
                    ),
                  ),
                ),
                AppLogo(
                  size: mediaqueryHeight(0.045, context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
