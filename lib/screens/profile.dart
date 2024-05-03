import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/profile_save_button_bloc/profile_save_button_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/form_keys.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/change_password_alert.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/change_password_text.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/email_textfield.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/headings.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/initstate/initial_actions.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/phone_textfield.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/profile_appbar.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/profile_pic_display.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/sizedbox_heading_textformfield.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/state_handler/profile_state_handler.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/submit_button.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/username_display.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/username_textfield.dart';

class ProfileScreen extends StatefulWidget {
  final bool fromDawer;
  ProfileScreen({super.key, this.fromDawer = false});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    profileInitialFunctions(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileSaveButtonBloc(),
      child: BlocListener<ProfileSaveButtonBloc, ProfileSaveButtonState>(
        listener: (context, state) {
          ProfileStateHandler.handleState(context, state);
        },
        child: Scaffold(
          backgroundColor: blackColor,
          appBar: PreferredSize(
              preferredSize:
                  Size(double.infinity, mediaqueryHeight(0.106, context)),
              child: profileAppBar(context, widget.fromDawer)),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
            child: SingleChildScrollView(
              child: Form(
                key: profileFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfilePictureDispaly(),
                    SizedBox(
                      height: mediaqueryHeight(0.015, context),
                    ),
                    UserNameDisaply(),
                    SizedBox(
                      height: mediaqueryHeight(0.015, context),
                    ),
                    profilePageHeadings(context, "Name"),
                    spaceBetweenHeadingAndTextfield(context),
                    UserNameTextField(),
                    SizedBox(
                      height: mediaqueryHeight(0.014, context),
                    ),
                    profilePageHeadings(context, "Phone"),
                    spaceBetweenHeadingAndTextfield(context),
                    PhoneTextField(),
                    SizedBox(
                      height: mediaqueryHeight(0.014, context),
                    ),
                    profilePageHeadings(context, "Email"),
                    spaceBetweenHeadingAndTextfield(context),
                    EmailTextField(),
                    SizedBox(
                      height: mediaqueryHeight(0.03, context),
                    ),
                    GestureDetector(
                      onTap: () {
                        changePasswordAlert(context);
                      },
                      child: changePasswordText(context),
                    ),
                 
                    SizedBox(
                      height: mediaqueryHeight(0.04, context),
                    ),
                    SubmitButton()
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
