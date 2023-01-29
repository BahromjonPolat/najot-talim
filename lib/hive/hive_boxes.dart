import 'package:hive/hive.dart';
import 'package:nt/models/coutries_model_for_hive.dart';

class Boxes {
  static Box<CountriesModelForHive> getCountries() => Hive.box<CountriesModelForHive>("all_countries");
}