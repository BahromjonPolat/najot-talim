/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 11:39:28
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, int> {
  BottomNavigationBarBloc() : super(0) {
    on<BottomBarChanged>((event, emit) => emit(event.index));
  }
}
