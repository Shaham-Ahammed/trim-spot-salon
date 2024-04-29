part of 'home_screen_page_controller_bloc.dart';

@immutable
sealed class HomeScreenPageControllerEvent {}

final class PageChanged extends HomeScreenPageControllerEvent {
  final int newPage;

  PageChanged({required this.newPage});
}

final class ChangeFirstPage extends HomeScreenPageControllerEvent {}

final class ChangeSecondPage extends HomeScreenPageControllerEvent {}
