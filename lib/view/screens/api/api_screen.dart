import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nt/blocs/api_bloc/api_bloc.dart';
import 'package:nt/models/countries_api_model.dart';
import 'package:nt/view/screens/api/components/build_card_widget.dart';

class ApiScreen extends StatefulWidget {
  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late ApiBloc _countriesApiBloc;

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
      child: BlocConsumer<ApiBloc, ApiState>(
        listener: (context, state) {
          if (state is ApiError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? ""),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ApiInitial) {
            return _buildLoading();
          } else if (state is ApiLoading) {
            return _buildLoading();
          } else if (state is ApiLoaded) {
            return BuildCardWidget(model: state.apiModel);
          } else if (state is ApiError) {
            return _buildError();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
  Widget _buildError() => const SizedBox(
        child: Center(child: Text("Something went wrong")),
      );
}
