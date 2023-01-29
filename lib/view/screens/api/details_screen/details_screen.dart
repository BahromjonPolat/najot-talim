import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nt/models/countries_api_model.dart';
import 'package:nt/models/coutries_model_for_hive.dart';
import 'package:nt/view/screens/api/details_screen/components/details_item_widget.dart';

// ignore: must_be_immutable
class DetatilsScreen extends StatelessWidget {
  CountriesModelForHive model;
  DetatilsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name}   ${model.emoji}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DetailsItemWidget(
                    title: "Capital:",
                    trailing: model.capital ?? "Capital",
                  ),
                  DetailsItemWidget(
                    title: "Continent:",
                    trailing: model.continent?.name ?? "Continent",
                  ),
                  DetailsItemWidget(
                    title: "Currency:",
                    trailing: model.currency ?? "Currency",
                  ),
                  DetailsItemWidget(
                    title: "Phone:",
                    trailing: model.phone  ?? "Phone",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
