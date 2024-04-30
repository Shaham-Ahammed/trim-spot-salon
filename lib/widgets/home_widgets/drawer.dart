import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/drawer_home/close_button.dart';
import 'package:trim_spot_barber_side/widgets/drawer_home/divider.dart';
import 'package:trim_spot_barber_side/widgets/drawer_home/listtile_items.dart';
import 'package:trim_spot_barber_side/widgets/drawer_home/profile_image.dart';
import 'package:trim_spot_barber_side/widgets/drawer_home/user_details.dart';
import 'package:trim_spot_barber_side/widgets/drawer_home/version_number.dart';

Drawer homeDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: blackColor,
    width: mediaqueryWidth(0.85, context),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
        child: Column(
          children: [
            CloseButtonDrawer(),
            Row(
              children: [
                Stack(
                  children: [ProfileImageDisplay(), ProfileImageEditButton()],
                ),
                SizedBox(
                  width: mediaqueryHeight(0.02, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userName(context),
                    userEmail(context),
                    userPhone(context),
                  ],
                )
              ],
            ),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            DrawerDivider(),
            SizedBox(
              height: mediaqueryHeight(0.01, context),
            ),
            listviewDrawerHome(context),
            versionNumber(context),
          ],
        ),
      ),
    ),
  );
}
