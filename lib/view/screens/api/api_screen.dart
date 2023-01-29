import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nt/blocs/api_bloc/api_bloc.dart';
import 'package:nt/view/screens/api/components/online_mode_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late ApiBloc _countriesApiBloc;

  var connectivityResult = (Connectivity().checkConnectivity());

  @override
  void initState() {
    _countriesApiBloc = BlocProvider.of(context);
    _countriesApiBloc.add(GetCountriesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.h),
      child: const OnlineModeWidget(),
    );
  }
}
