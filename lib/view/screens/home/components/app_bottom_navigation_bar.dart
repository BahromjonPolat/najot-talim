import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt/blocs/blocs.dart';
import 'package:nt/config/constants/constants.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          items: List.generate(4, (index) => _setItem(index)),
          onTap: (i) {
            BottomNavigationBarBloc barBloc = BlocProvider.of(context);
            barBloc.add(BottomBarChanged(i));
          },
        );
      },
    );
  }

  BottomNavigationBarItem _setItem(int index) => BottomNavigationBarItem(
        icon: Icon(_getIcon(index)),
        label: _getLabel(index),
      );

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return AppIcons.api;
      case 1:
        return AppIcons.download;
      case 2:
        return AppIcons.inOut;
      default:
        return AppIcons.settings;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'API';
      case 1:
        return 'Download';
      case 2:
        return 'Card';
      default:
        return 'Settings';
    }
  }
}
