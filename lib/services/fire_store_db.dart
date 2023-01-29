import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nt/models/card_model.dart';

class FSDBService {
  static FirebaseFirestore fire = FirebaseFirestore.instance;
  static creatCard(CardModel cardModel) async {
    fire.collection("cards").doc(cardModel.cardId).set(cardModel.toJson());
  }

  static updateCard(CardModel card) async {
    fire.collection("cards").doc(card.cardId).update(card.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getCard(String userId) =>
      fire.collection("cards").where('userId', isEqualTo: userId).snapshots();

  static deleteCard(String cardId) async {
    fire.collection("cards").doc(cardId).delete();
  }
}
