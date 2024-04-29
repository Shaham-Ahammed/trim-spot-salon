part of 'bottom_navigation_bar_bloc.dart';

@immutable
sealed class BottomNavigationBarState {
  final int page;

  BottomNavigationBarState({required this.page});
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {
 
  BottomNavigationBarInitial({required super.page});
}
