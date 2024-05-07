import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';

Color fontColorOfOccasionalClosure(DateTime dateTime, context) {
   final date = DateFormat('dd-MM-yyyy').format(dateTime);
  final occasionalClosure =
      BlocProvider.of<OccasionalClosureBloc>(context).state.occasionalHolidays;
  return occasionalClosure.contains(date) ? blackColor : greyColor;
}

Color containerColorOfOccasionalClosure(DateTime dateTime, context) {
  final date = DateFormat('dd-MM-yyyy').format(dateTime);
  final occasionalClosure =
      BlocProvider.of<OccasionalClosureBloc>(context).state.occasionalHolidays;
  return occasionalClosure.contains(date) ? cyanColor : Colors.grey.shade800;
}

Color containerBorderColorOfOccasionalClosure(DateTime dateTime, context) {
  final date = DateFormat('dd-MM-yyyy').format(dateTime);
  final occasionalClosure =
      BlocProvider.of<OccasionalClosureBloc>(context).state.occasionalHolidays;
  return occasionalClosure.contains(date) ? cyanColor : greyColor3;
}
