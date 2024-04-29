import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/change_password_alert.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/change_password_text.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/email_textfield.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/headings.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/phone_textfield.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/profile_appbar.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/profile_pic_display.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/shop_image_caption.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/shop_image_display.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/sizedbox_heading_textformfield.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/submit_button.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/username_display.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/username_textfield.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    context.read<ProfilePhoneBloc>().add(ProfilPhoneEdit(editPressed: false));
    context
        .read<ProfileNameBloc>()
        .add(NameEditButtonPressed(editPressed: false));
    context
        .read<ProfileEmailBloc>()
        .add(EmailEditButtonPressed(editPressed: false));

    profilePhoneController.text =
        BlocProvider.of<ProfilePhoneBloc>(context).state.phone;
    profileNameController.text =
        BlocProvider.of<ProfileNameBloc>(context).state.name;
    profileEmailController.text =
        BlocProvider.of<ProfileEmailBloc>(context).state.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, mediaqueryHeight(0.106, context)),
          child: profileAppBar(context)),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
        child: SingleChildScrollView(
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
                height: mediaqueryHeight(0.014, context),
              ),
              profilePageHeadings(context, "Shop Image"),
              shopImageCaption(context),
              SizedBox(
                height: mediaqueryHeight(0.012, context),
              ),
              ShopImageDisplay(),
              SizedBox(
                height: mediaqueryHeight(0.04, context),
              ),
              SubmitButton()
            ],
          ),
        ),
      )),
    );
  }
}
