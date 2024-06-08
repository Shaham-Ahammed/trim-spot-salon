import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/formkey.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/change_password/save_button.dart';
import 'package:trim_spot_barber_side/widgets/change_password/state_handler/handle_state.dart';
import 'package:trim_spot_barber_side/widgets/change_password/textfields.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          ChangePasswordStateHandler.handleState(context, state);
        },
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: newPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NewPasswordTextField(),
                    SizedBox(height: mediaqueryHeight(0.03, context)),
                    ConfirmNewPasswordTextField(),
                    SizedBox(
                      height: mediaqueryHeight(0.05, context),
                    ),
                    saveButtonOnChangePassword(context)
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  
}
