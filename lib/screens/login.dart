import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/login_button_bloc/login_validation_bloc.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/login_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/error_snackbars.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/login_page/form_key.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/utils/splash_screen/screen_decision.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/login_button.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/resgister_text.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/textformfields.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/titles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginValidationBloc(),
      child: BlocListener<LoginValidationBloc, LoginValidationState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            loadingIndicator(context);
          }
          if (state is NetworkError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(networkErrorSnackbar(context));
          }
          if (state is LoginFailure) {
            if (state.exception == "incorrect password") {
              loginPasswordController.clear();
            }
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(errorSnackBar(state.exception));
          }
          if (state is LoginSuccess) {
            Navigator.pop(context);
            checkTheRegistrationStatus(loginPhoneController.text, context);
          }
        },
        child: Scaffold(
          backgroundColor: blackColor,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: loginFormKey,
            child: SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: backgroundImage(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Padding(
                      padding: EdgeInsets.all(mediaqueryHeight(0.04, context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: mediaqueryHeight(0.15, context),
                          ),
                          welcomeBackText(context),
                          subtitleText(context),
                          SizedBox(
                            height: mediaqueryHeight(0.13, context),
                          ),
                          PhoneLoginWidget(),
                          SizedBox(
                            height: mediaqueryHeight(0.03, context),
                          ),
                          PasswordLoginWidget(),
                          SizedBox(
                            height: mediaqueryHeight(0.04, context),
                          ),
                          Center(child: const LoginButton()),
                          SizedBox(
                            height: mediaqueryHeight(0.18, context),
                          ),
                          const RegisterNowText()
                        ],
                      ),
                    ),
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
