import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/registration_page/cyan_container.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/profile_pic_edit_button.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
            color: boxColor(context),
            borderRadius: BorderRadius.circular(90),
            child: InkWell(
              onTap: () {
                return null;
              },
              borderRadius: BorderRadius.circular(90),
              child: Container(
                width: mediaqueryWidth(0.35, context),
                height: mediaqueryHeight(0.04, context),
                decoration: BoxDecoration(
                    color: transparentColor,
                    borderRadius: BorderRadius.circular(90)),
                child: Center(
                  child: myFont("Save Changes",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.02, context),
                      fontWeight: FontWeight.w600,
                      fontColor: blackColor),
                ),
              ),
            )));
  }
}

Color boxColor(context) {
  if (BlocProvider.of<ProfileUserImageBloc>(context,listen: true)
          .state
          .newImagePath
          .isEmpty &&
      BlocProvider.of<ProfilePhoneBloc>(context,listen: true).state.editPressed == false &&
      BlocProvider.of<ProfileNameBloc>(context,listen: true).state.editPressed == false &&
      BlocProvider.of<ProfileEmailBloc>(context,listen: true).state.editPressed == false &&
      BlocProvider.of<ProfileShopImageBloc>(context,listen: true)
          .state
          .newShopImagePath
          .isEmpty) {
    return greyColor3;
  } else {
    return cyanColor;
  }
}
