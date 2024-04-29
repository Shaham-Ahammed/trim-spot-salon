part of 'bottom_navigation_bar_bloc.dart';

@immutable
sealed class BottomNavigationBarEvent {}

final class BottomNavItemPressed extends BottomNavigationBarEvent {
  final int page;

  BottomNavItemPressed({required this.page});
  
}
