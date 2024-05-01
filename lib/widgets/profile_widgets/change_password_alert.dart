import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/profile_password_bloc/profile_password_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/form_keys.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/newpassword_textfield,.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/oldpassword_textfield.dart';

Future<dynamic> changePasswordAlert(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black87,
    context: context,
    builder: (BuildContext context) {
      return BlocListener<ProfilePasswordBloc, ProfilePasswordState>(
        listener: (context, state) {
          if (state is PasswordUpdating) {
            loadingIndicator(context);
          }
          if (state is PasswordUpdated) {
            context
                .read<UserDetailsBloc>()
                .add(FetchingUserDetailsFromSplash());
            Navigator.pop(context);
            Navigator.pop(context);

            profileNewPasswordController.clear();
            profileOldPasswordController.clear();
            ScaffoldMessenger.of(context)
                .showSnackBar(passwordUpdatedSnackBar());
          }
        },
        child: PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: blackColor,
            insetPadding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.02, context)),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: greyColor3,
              ),
              borderRadius: BorderRadius.all(
                Radius.zero,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediaqueryHeight(0.02, context),
                  horizontal: mediaqueryHeight(0.03, context)),
              child: Form(
                key: profilePasswordKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myFont("Change Password",
                        fontFamily: balooChettan,
                        fontSize: mediaqueryHeight(0.024, context),
                        fontWeight: FontWeight.normal,
                        fontColor: whiteColor),
                    SizedBox(
                      height: mediaqueryHeight(0.017, context),
                    ),
                    oldPasswordTextField(),
                    SizedBox(
                      height: mediaqueryHeight(0.018, context),
                    ),
                    NewPasswordTextFormField(),
                    SizedBox(
                      height: mediaqueryHeight(0.018, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: mediaqueryWidth(0.1, context),
                        ),
                        submitButtonCyan(context,
                            buttonColor: whiteColor,
                            text: "cancel",
                            heigh: mediaqueryHeight(0.03, context),
                            width: mediaqueryWidth(0.2, context),
                            fontSize: mediaqueryHeight(0.018, context),
                            function: () {
                          Navigator.pop(context);
                          profileNewPasswordController.clear();
                          profileOldPasswordController.clear();
                          return null;
                        }),
                        submitButtonCyan(context,
                            text: "confirm",
                            heigh: mediaqueryHeight(0.03, context),
                            width: mediaqueryWidth(0.2, context),
                            fontSize: mediaqueryHeight(0.018, context),
                            function: () {
                          context.read<ProfilePasswordBloc>().add(
                              PressedSubmitButtonPressed(context: context));
                          return null;
                        }),
                        SizedBox(
                          width: mediaqueryWidth(0.1, context),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

SnackBar passwordUpdatedSnackBar() {
  return SnackBar(
      backgroundColor: Colors.green.shade400,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      content: Center(
          child: Text(
        "password updated",
        style: TextStyle(color: whiteColor),
      )));
}
