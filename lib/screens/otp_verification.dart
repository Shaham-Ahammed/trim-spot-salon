import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/data/firebae_authentication/phone_number_validation.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/headings_and_texts.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/otp_box.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/resend_otp_widgets.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/state_handler/state_handler.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/submit_button.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/screen_padding.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterButtonBloc, RegisterButtonState>(
      listener: (context, state) {
        OtpStateHandler.handleState(context, state);
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
                      height: mediaqueryHeight(0.1, context),
                    ),

                    ResendOtpWidgets(),

                    SizedBox(
                      height: mediaqueryHeight(0.1, context),
                    ),
                   
                    submitButtonOtpPage(
                        context, PhoneNumberAuthentication.verficationId),
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
