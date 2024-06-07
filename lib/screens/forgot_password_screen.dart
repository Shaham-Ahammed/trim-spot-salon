import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/formkey.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/forget_password/back_button.dart';
import 'package:trim_spot_barber_side/widgets/forget_password/button.dart';
import 'package:trim_spot_barber_side/widgets/forget_password/caption_and_heading.dart';
import 'package:trim_spot_barber_side/widgets/forget_password/foreget_password_textfield.dart';
import 'package:trim_spot_barber_side/widgets/forget_password/lock_icon.dart';
import 'package:trim_spot_barber_side/widgets/forget_password/state_handlers/handle_state.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/screen_padding.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          ForgetPasswordStateHandler.handleState(context, state);
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding:screenPadding(context),
              child: Form(
                    key: forgotPasswordFormKey,
                child: Center(
                  child: Column(
                    children: [
                      const BackArrowButton(),
                      SizedBox(
                        height: mediaqueryHeight(0.16, context),
                      ),
                      const LockIcon(),
                      SizedBox(
                        height: mediaqueryHeight(0.02, context),
                      ),
                      forgetPasswordFont(context),
                      SizedBox(
                        height: mediaqueryHeight(0.02, context),
                      ),
                      descriptionFont(context),
                      SizedBox(
                        height: mediaqueryHeight(0.04, context),
                      ),
                      const ForgetPasswordTextField(),
                      SizedBox(
                        height: mediaqueryHeight(0.04, context),
                      ),
                      sendOtpButton(context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
