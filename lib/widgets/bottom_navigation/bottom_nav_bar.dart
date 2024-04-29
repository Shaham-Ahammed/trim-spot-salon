import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:trim_spot_barber_side/blocs/bottom_navigation_bloc/bottom_navigation_bar_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/bottom_navigation_list.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
        onTabChange: (value) {
          context
              .read<BottomNavigationBarBloc>()
              .add(BottomNavItemPressed(page: value));
        },
        padding:
            EdgeInsets.symmetric(horizontal: mediaqueryHeight(0.02, context)),
        activeColor: cyanColor,
        color: greyColor,
        gap: mediaqueryHeight(0.01, context),
        backgroundColor: appBarColor,
        rippleColor: cyanColor,
        
        tabs: gButtons);
  }
}
