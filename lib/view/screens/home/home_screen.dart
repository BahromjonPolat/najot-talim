/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 10:55:09
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt/blocs/blocs.dart';
import 'package:nt/view/screens/card/select_card.dart';
import 'package:nt/view/screens/home/components/app_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    Container(),
    Container(),
   const SelectCard(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: pages,
          ),
          bottomNavigationBar:const AppBottomNavigationBar(),
        );
      },
    );
  }
}
