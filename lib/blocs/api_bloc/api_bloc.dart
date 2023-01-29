import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nt/hive/hive_boxes.dart';
import 'package:nt/models/countries_api_model.dart';
import 'package:nt/models/coutries_model_for_hive.dart';
import 'package:nt/services/api_requests.dart';
import 'package:nt/services/http_result.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<GetCountriesList>(fetchData);
  }

  FutureOr fetchData(GetCountriesList event, Emitter emit) async {
    emit(ApiLoading());
    var a;

    HttpResult result = await ApiRequests.instance.getCounties();

    if (result.isSuccess) {
      List<CountriesModelForHive> dataList =
          (result.getData()["countries"] as List)
              .map((e) => CountriesModelForHive.fromJson(e))
              .toList();
      await Boxes.getCountries().clear();
      await Boxes.getCountries().addAll(dataList);
      emit(ApiLoaded(dataList));
    } else {
      emit(ApiFailed());
    }
  }
}
