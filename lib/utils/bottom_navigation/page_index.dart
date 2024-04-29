import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/bottom_navigation_bloc/bottom_navigation_bar_bloc.dart';

int pageIndex(context) {
  return BlocProvider.of<BottomNavigationBarBloc>(context, listen: true)
      .state
      .page;
}
