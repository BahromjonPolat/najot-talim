import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nt/config/routes/routes.dart';
import 'package:nt/models/countries_api_model.dart';
import 'package:nt/models/coutries_model_for_hive.dart';
import 'package:nt/view/screens/api/details_screen/details_screen.dart';

// ignore: must_be_immutable
class BuildCardWidget extends StatelessWidget {
  List<CountriesModelForHive> model;
  BuildCardWidget({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetatilsScreen(
                    model: model[index],
                  ),
                ),
              );
            },
            title: Text("${model[index].name}"),
            trailing: Text("${model[index].phone}"),
            leading: Text("${index + 1}"),
          ),
        );
      },
    );
  }
}
