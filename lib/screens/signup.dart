import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/utils/registration_page/form_key.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/closing_time_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/closing_time_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/location_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/opening_time_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/service_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/shop_image_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/headings.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/holiday_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/license_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/location_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/opening_time_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/profile_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/register_button.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/screen_padding.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/service_piker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/shop_image_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/sizedbox.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/state_handler/signup_state_handler.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/textfields.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/welocme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterButtonBloc, RegisterButtonState>(
      listener: (context, state) {
        SignUpStateHandler.stateHandler(context, state);
      },
      child: Scaffold(
        backgroundColor: blackColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: backgroundImage(),
            child: SingleChildScrollView(
              reverse: false,
              child: Padding(
                padding: screenPadding(context),
                child: Form(
                  key: registrationFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaqueryHeight(0.04, context),
                      ),
                      welcomeText(),
                      SizedBox(
                        height: mediaqueryHeight(0.02, context),
                      ),
                      const NameTextField(),
                      textFormFieldSizedBox(context),
                      const EmailTextFormField(),
                      textFormFieldSizedBox(context),
                      const PhoneTextFormField(),
                      textFormFieldSizedBox(context),
                      const ShopNameTextFormField(),
                      textFormFieldSizedBox(context),
                      const LocationPicker(),
                      LocationValidationErrorMessage(),
                      textFormFieldSizedBox(context),
                      const ProofsHeading(),
                      const SizedBox(
                        height: 3,
                      ),
                      const Row(
                        children: [
                          ShopLicensePicker(),
                          ProfilePicker(),
                        ],
                      ),
                      textFormFieldSizedBox(context),
                      const ShopImageHeading(),
                      const SizedBox(
                        height: 3,
                      ),
                      const ShopImagePicker(),
                      ShopImageError(),
                      textFormFieldSizedBox(context),
                      const ServiceHeading(),
                      const SizedBox(
                        height: 3,
                      ),
                      servicePicker(),
                      ServiceNotPickedError(),
                      textFormFieldSizedBox(context),
                      const WorkingHoursHeading(),
                      const SizedBox(
                        height: 3,
                      ),
                      const OpeningTimePicker(),
                      OpenTimeError(),
                      SizedBox(
                        height: mediaqueryHeight(0.02, context),
                      ),
                      const ClosingTimePicker(),
                      ClosingTimeError(),
                      textFormFieldSizedBox(context),
                      const RegisterHeadings(heading: "Holidays"),
                      const SizedBox(
                        height: 3,
                      ),
                      HolidayPicker(),
                      textFormFieldSizedBox(context),
                      PasswordTextFormField(),
                      textFormFieldSizedBox(context),
                      ConfirmPasswordTextFormField(),
                      SizedBox(
                        height: mediaqueryHeight(0.05, context),
                      ),
                      const RegisterButton(),
                      SizedBox(height: mediaqueryHeight(0.06, context)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


