import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt/blocs/get_card/get_card_event.dart';
import 'package:nt/blocs/get_card/get_card_state.dart';
import 'package:nt/config/components/toast.dart';

import '../../services/fire_store_db.dart';

class GetCardBloc extends Bloc<GetCardEvent, GetCardState> {
  GetCardBloc() : super(GetCardInitial()) {
    on<GetStartCardEvent>(getAllProducts);
  }

  Future<void> getAllProducts(
    GetStartCardEvent event,
    Emitter<GetCardState> emmit,
  ) async {
    try {
      emmit(GetCardsProccesState());
      FSDBService.getCard(event.userId);
      emmit(GetCardsSuccesState());

      emmit(GetCardsFailureState());
    } catch (e) {
      Utils.fireToast('Yuklashda muammo');
      print(e);
    }
  }
}
