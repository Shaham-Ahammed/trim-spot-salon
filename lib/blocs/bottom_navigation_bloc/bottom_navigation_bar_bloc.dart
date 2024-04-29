import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial(page: 0)) {
    on<BottomNavItemPressed>(_bottomNavItemPressed);
  }
  _bottomNavItemPressed(
      BottomNavItemPressed event, Emitter<BottomNavigationBarState> emit) {
    emit(BottomNavigationBarInitial(page: event.page));
  }
}
