import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_screen_page_controller_event.dart';
part 'home_screen_page_controller_state.dart';

class HomeScreenPageControllerBloc
    extends Bloc<HomeScreenPageControllerEvent, HomeScreenPageControllerState> {
  HomeScreenPageControllerBloc()
      : super(HomeScreenPageControllerInitial(currentPage: 0)) {
    on<PageChanged>(_pageChanged);
    on<ChangeFirstPage>(_changeFirstPage);
    on<ChangeSecondPage>(_changeSecondPage);
  }
  _pageChanged(PageChanged event, Emitter<HomeScreenPageControllerState> emit) {
    emit(HomeScreenPageControllerInitial(currentPage: event.newPage));
  }

  _changeFirstPage(
      ChangeFirstPage event, Emitter<HomeScreenPageControllerState> emit) {
    emit(NavigateToSecondPage(currentPage: 1));
  }
   _changeSecondPage(
      ChangeSecondPage event, Emitter<HomeScreenPageControllerState> emit) {
    emit(NavigateToFirstPage(currentPage: 0));
  }
}
