/*s

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 10:53:33
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nt/blocs/api_bloc/api_bloc.dart';
import 'package:nt/config/config.dart';

import 'blocs/blocs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => BottomNavigationBarBloc()),
            BlocProvider(create: (_) => ApiBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Najot Ta'lim",
            theme: AppTheme.getApplicationTheme(),
            navigatorKey: AppNavigator.navigatorKey,
            initialRoute: RouteNames.initial,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          ),
        );
      },
    );
  }
}
