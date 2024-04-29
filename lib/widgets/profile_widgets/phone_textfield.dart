import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_barber_side/screens/edit_phone_number.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePhoneBloc, ProfilePhoneState>(
      builder: (context, state) {
        return Container(
          height: mediaqueryHeight(0.05, context),
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
                  style: TextStyle(
                      color: state.editPressed ? blackColor : whiteColor,
                      fontFamily: b612),
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: profilePhoneController,
                  cursorColor: Colors.blueGrey.shade200,
                  enableInteractiveSelection: false,
                  enabled: state.editPressed,
                )),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          NoTransitionPageRoute(child: (EditPhoneScreen())));
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
