import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nt/models/countries_api_model.dart';
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
      List<ApiModel> dataList = (result.getData()["countries"] as List)
          .map((e) => ApiModel.fromJson(e))
          .toList();

      emit(ApiLoaded(dataList));
    } else {
      emit(ApiFailed());
    }
  }
}
