import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nt/blocs/api_bloc/api_bloc.dart';
import 'package:nt/hive/hive_boxes.dart';
import 'package:nt/models/countries_api_model.dart';
import 'package:nt/models/coutries_model_for_hive.dart';
import 'package:nt/view/screens/api/components/build_card_widget.dart';
import 'package:nt/view/screens/api/details_screen/details_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiScreen extends StatefulWidget {
  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late ApiBloc _countriesApiBloc;
  Box<CountriesModelForHive>? countriesBox;
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
      child: _withBloc(),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
  Widget _buildError() => const SizedBox(
        child: Center(child: Text("Something went wrong")),
      );

  Widget _withBloc() {
    return BlocConsumer<ApiBloc, ApiState>(
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
          return with_hive();
        } else {
          return with_hive();
        }
      },
    );
  }

  Widget with_hive() {
    return ValueListenableBuilder(
      valueListenable: Boxes.getCountries().listenable(),
      builder: (
        context,
        Box<CountriesModelForHive> countryBox,
        _,
      ) {
        countriesBox = countryBox;
        return ListView.builder(
          itemCount: countriesBox!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetatilsScreen(
                        model: countriesBox!.getAt(index)!,
                      ),
                    ),
                  );
                },
                title: Text("${countriesBox!.getAt(index)!.name}"),
                trailing: Text("${countriesBox!.getAt(index)!.emoji}"),
                leading: Text("${index + 1}"),
              ),
            );
          },
        );
      },
    );
  }
}
