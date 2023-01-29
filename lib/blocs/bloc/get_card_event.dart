abstract class GetCardEvent {}

class GetStartCardEvent extends GetCardEvent {
  final String userId;

  GetStartCardEvent(this.userId);
}
