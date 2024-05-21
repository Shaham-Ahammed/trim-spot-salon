import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEmailBloc, ProfileEmailState>(
      builder: (context, state) {
        return Container(
          height: mediaqueryHeight(0.06, context),
          decoration: BoxDecoration(
              color: state.editPressed ? whiteColor : greyColor3,
              borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.03, context)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "please enter a email";
                    } else if (!value.trim().contains("@gmail.com")) {
                      return "enter a valid email";
                    }
                    return null;
                  },
                  style: TextStyle(
                      color: state.editPressed ? blackColor : whiteColor,
                      fontFamily: b612),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: mediaqueryHeight(0.0072, context)),
                      border: InputBorder.none),
                  controller: profileEmailController,
                  cursorColor: Colors.blueGrey.shade200,
                  enableInteractiveSelection: false,
                  enabled: state.editPressed,
                )),
                GestureDetector(
                    onTap: () {
                      context
                          .read<ProfileEmailBloc>()
                          .add(EmailEditButtonPressed(editPressed: true));
                    },
                    child: Icon(Icons.edit))
              ],
            ),
          ),
        );
      },
    );
  }
}
