part of 'home_screen_page_controller_bloc.dart';

@immutable
sealed class HomeScreenPageControllerState {
  final int currentPage;

  HomeScreenPageControllerState({required this.currentPage});
}

final class HomeScreenPageControllerInitial
    extends HomeScreenPageControllerState {
  HomeScreenPageControllerInitial({required super.currentPage});
}

final class NavigateToSecondPage extends HomeScreenPageControllerState{
  NavigateToSecondPage({required super.currentPage});

}
final class NavigateToFirstPage extends HomeScreenPageControllerState{
  NavigateToFirstPage({required super.currentPage});

}