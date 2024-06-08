import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/formkey.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/forget_pass_otp_page.dart/otp_box.dart';
import 'package:trim_spot_barber_side/widgets/forget_pass_otp_page.dart/resend_otp_widgets.dart';
import 'package:trim_spot_barber_side/widgets/forget_pass_otp_page.dart/state_handler/state_handler.dart';
import 'package:trim_spot_barber_side/widgets/forget_pass_otp_page.dart/submit_otp_button.dart';

import 'package:trim_spot_barber_side/widgets/otp_page/headings_and_texts.dart';
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
      body: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          ForgetPasswordOtpPageStateHandler.handleState(context, state);
        },
        child: SafeArea(
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
                      key: forgotPasswordOtpFieldFormKey,
                      child: OtpBox(),
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.1, context),
                    ),
                    ResendOtpWidgetsForgetPassword(),
                    SizedBox(
                      height: mediaqueryHeight(0.1, context),
                    ),
                    (submitButtonChangePasswordOtpPage(context)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
