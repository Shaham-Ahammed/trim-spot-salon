import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/home_screen_pageview_bloc/home_screen_page_controller_bloc.dart';

final PageController homePageController = PageController();

final duration = Duration(seconds: 5);

int currentPage(context) {
  return BlocProvider.of<HomeScreenPageControllerBloc>(context, listen: false)
      .state
      .currentPage;
}
