import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/login_button_bloc/login_validation_bloc.dart';
import 'package:trim_spot_barber_side/screens/forgot_password_screen.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/login_page/form_key.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/login_button.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/resgister_text.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/state_handler/login_state_handler.dart';
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
          LoginStateHandler.handleState(context, state);
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
                          SizedBox(height: mediaqueryHeight(0.015, context)),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(FadeTransitionPageRoute(child: ForgotPasswordScreen()));
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: myFont("forgot password ?",
                                    textalign: TextAlign.end,
                                    fontFamily: balooChettan,
                                    fontSize: mediaqueryHeight(0.016, context),
                                    fontWeight: FontWeight.w500,
                                    fontColor: Colors.blueGrey.shade200),
                              )),
                          SizedBox(
                            height: mediaqueryHeight(0.04, context),
                          ),
                          Center(child: const LoginButton()),
                          SizedBox(
                            height: mediaqueryHeight(0.17, context),
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
