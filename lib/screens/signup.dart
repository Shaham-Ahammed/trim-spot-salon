import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/utils/error_snackbars.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/utils/registration_page/container_validations.dart';
import 'package:trim_spot_barber_side/utils/registration_page/form_key.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/closing_time_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/closing_time_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/location_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/opening_time_error.dart';
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
        if (state is LoadingState) {
          loadingIndicator(context);
        }
        if (state is NetworkError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(networkErrorSnackbar(context));
        
        }
        if (state is RegisrationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar("${state.error}"));
          Navigator.pop(context);
        }
        if (state is PhoneNumberAlreadyRegistered) {
          registrationPhoneController.clear();
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar("phone already registered"));
          Navigator.pop(context);
        }
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
                      BlocBuilder<ServiceBloc, ServiceBlocState>(
                        builder: (context, state) {
                          final map = state.switches;
                          bool anySelected = false;
                          for (var selected in map.values) {
                            if (selected == true) {
                              anySelected = true;
                            }
                          }
                          if (!anySelected && registerbuttonPressed(context)) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: mediaqueryHeight(0.02, context),
                                    top: mediaqueryHeight(0.007, context)),
                                child: Text(
                                  "pick select atleast one service",
                                  style: TextStyle(
                                    color: Colors.red.shade800,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
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
