import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/screens/registration_successful.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';

import 'package:trim_spot_barber_side/widgets/otp_page/headings_and_texts.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/otp_box.dart';

import 'package:trim_spot_barber_side/widgets/otp_page/submit_button.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/screen_padding.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String verificationId;
  const OtpVerificationScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterButtonBloc, RegisterButtonState>(
      listener: (context, state) {
        if (state is NavigateToRegisterSuccessPage) {
          Navigator.pop(context);
          Navigator.of(context).pushAndRemoveUntil(
            FadeTransitionPageRoute(
                child: RegistrationSuccessfulMessageScreen()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blackColor,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: backgroundImage(),
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
                    const OtpBoxe(),
                    SizedBox(
                      height: mediaqueryHeight(0.3, context),
                    ),
                    submitButtonOtpPage(context, verificationId)
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
