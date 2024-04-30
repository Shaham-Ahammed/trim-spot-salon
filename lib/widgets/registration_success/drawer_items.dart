import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/customer_support.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/widgets/registration_success/logout_confirmation.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
        vertical: BorderSide(color: whiteColor, width: .4),
      )),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: mediaqueryHeight(0.122, context),
              child: DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  color: appBarColor,
                ),
              ),
            ),
            ListTile(
              title: myFont("Logout",
                  fontFamily: b612,
                  fontSize: mediaqueryHeight(0.02, context),
                  fontWeight: FontWeight.normal,
                  fontColor: greyColor),
              onTap: () {
                logoutConfirmationFailureMessageScreen(context);
              },
            ),
            ListTile(
              title: myFont("Customer support",
                  fontFamily: b612,
                  fontSize: mediaqueryHeight(0.02, context),
                  fontWeight: FontWeight.normal,
                  fontColor: greyColor),
              onTap: () {
                Navigator.of(context)
                    .push(NoTransitionPageRoute(child: CustomerSupport()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
