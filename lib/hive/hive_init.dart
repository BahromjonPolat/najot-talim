import 'package:hive/hive.dart';
import 'package:nt/models/coutries_model_for_hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveData {
  static init() async {
    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    Hive.registerAdapter(CountriesModelForHiveAdapter());
    Hive.registerAdapter(ContinentAdapter());
    await Hive.openBox<CountriesModelForHive>("all_countries");
  }
}
