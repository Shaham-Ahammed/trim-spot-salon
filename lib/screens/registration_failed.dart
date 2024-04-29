import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/registration_success_failure.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_barber_side/widgets/registration_failed/appbar_items.dart';
import 'package:trim_spot_barber_side/widgets/registration_failed/dawer_items.dart';
import 'package:trim_spot_barber_side/widgets/registration_failed/failure_image.dart';
import 'package:trim_spot_barber_side/widgets/registration_failed/registration_failed_text.dart';

class RegistrationFailedMessageScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: blackColor,
    ));

    return Scaffold(
      key:registrationFailedScaffoldKey,
      backgroundColor: blackColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, mediaqueryHeight(0.11, context)),
        child:AppBarItemsFailed()
      ),
      drawer: Drawer(
        width: mediaqueryWidth(0.6, context),
        backgroundColor: blackColor,
        child: DrawerItemsRegistrationFailure()
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(mediaqueryWidth(0.08, context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: mediaqueryHeight(0.099, context)),
              RegistrationFailureMessage(),
              SizedBox(height: mediaqueryHeight(0.038, context)),
              FailureImage()
            ],
          ),
        ),
      ),
    );
  }
}

