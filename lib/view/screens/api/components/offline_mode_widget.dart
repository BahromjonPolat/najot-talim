import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nt/hive/hive_boxes.dart';
import 'package:nt/models/coutries_model_for_hive.dart';
import 'package:nt/view/screens/api/details_screen/details_screen.dart';

// ignore: must_be_immutable
class OfflineModeWidget extends StatelessWidget {
  Box<CountriesModelForHive>? countriesBox;

  OfflineModeWidget({super.key});
  @override
  Widget build(BuildContext context) {
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
