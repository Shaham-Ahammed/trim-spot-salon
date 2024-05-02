import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/headings_and_texts.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/otp_box.dart';

import 'package:trim_spot_barber_side/widgets/otp_page/submit_button.dart';
import 'package:trim_spot_barber_side/widgets/profile_otp_widgets/appbar.dart';

class OtpVerficationProfileSection extends StatelessWidget {
  const OtpVerficationProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOtpVerficiationProfile(context),
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                otpVerficationHeading(context),
                  SizedBox(
                    height: mediaqueryHeight(0.26, context),
                  ),
                  sixDigitCodeHeading(context),
                  captionText(),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  const OtpBoxe(),
                  SizedBox(
                    height: mediaqueryHeight(0.3, context),
                  ),
                  submitButtonOtpPage(context, "")
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
