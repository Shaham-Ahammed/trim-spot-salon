import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/homepage/drawer/scaffold_key.dart';
import 'package:trim_spot_barber_side/utils/logo.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class AppBarHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHeight(0.12, context),
      decoration: BoxDecoration(color: appBarColor),
      child: Column(
        children: [
          SizedBox(height: mediaqueryHeight(0.035, context)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.05, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.scale(
                    scale: mediaqueryHeight(0.0016, context),
                    child: GestureDetector(
                        onTap: () {
                          homeScaffoldKey.currentState?.openDrawer();
                        },
                        child: CircleAvatar(
                          radius: mediaqueryHeight(0.029, context),
                          backgroundImage: NetworkImage(context
                              .watch<UserDetailsBloc>()
                              .state
                              .profileImage),
                        ))),
                AppLogo(
                  size: mediaqueryHeight(0.045, context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
