import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/home_screen_pageview_bloc/home_screen_page_controller_bloc.dart';

import 'package:trim_spot_barber_side/utils/homepage/animation_control.dart';

Timer pageViewAutomaticTransition(BuildContext context) {
    return Timer.periodic(duration, (Timer timer) {
    if (currentPage(context) < 1) {
      context.read<HomeScreenPageControllerBloc>().add(ChangeFirstPage());
    } else {
      context.read<HomeScreenPageControllerBloc>().add(ChangeSecondPage());
    }
    homePageController.animateToPage(
      currentPage(context),
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  });
  }