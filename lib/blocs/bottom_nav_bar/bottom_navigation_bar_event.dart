part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent {
  BottomNavigationBarEvent() : super();
}

class BottomBarChanged extends BottomNavigationBarEvent {
  final int index;
  BottomBarChanged(this.index);
}
