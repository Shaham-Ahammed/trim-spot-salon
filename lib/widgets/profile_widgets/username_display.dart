import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class UserNameDisaply extends StatelessWidget {
  const UserNameDisaply({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: myFont(context.watch<UserDetailsBloc>().state.userName,
          fontFamily: bebasNeue,
          fontSize: mediaqueryHeight(0.028, context),
          fontWeight: FontWeight.normal,
          fontColor: whiteColor),
    );
  }
}
