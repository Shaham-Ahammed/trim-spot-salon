import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/data/firebae_authentication/phone_number_validation.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';
import 'package:trim_spot_barber_side/widgets/forget_pass_otp_page.dart/resend_otp_widgets.dart';

import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/headings_and_texts.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/otp_box.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/resend_otp_widgets.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/state_handler/state_handler.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/submit_button.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/screen_padding.dart';

class ForgetPassOtpVerificationScreen extends StatelessWidget {
  const ForgetPassOtpVerificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: screenPadding(context),
              child: Column(
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
                  Form(
                    //  key: registerOtpFormKey,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueGrey, width: 2)),
                      width: mediaqueryWidth(0.23, context),
                      child: TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "please enter the otp";
                          } else if (value!.length < 6) {
                            return "otp must contian 6 digits";
                          } else {
                            return null;
                          }
                        },
                        enableInteractiveSelection: false,
                        cursorColor: Colors.blueGrey,
                        maxLength: 6,
                        //       controller: registerOtpController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: bebasNeue,
                            fontSize: mediaqueryHeight(0.027, context)),
                        decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: mediaqueryWidth(0.02, context)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.1, context),
                  ),
                  ResendOtpWidgetsForgetPassword(),
                  SizedBox(
                    height: mediaqueryHeight(0.1, context),
                  ),
                  (submitButtonCyan(context, function: () {
                    return null;
                  },
                      heigh: mediaqueryHeight(0.06, context),
                      text: "submit",
                      width: mediaqueryWidth(0.5, context))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
