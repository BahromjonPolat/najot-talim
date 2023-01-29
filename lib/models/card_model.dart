class CardModel {
  String? cardId;
  List? gradient;
  String? cardNumber;
  String? cardName;
  String? moneyAmount;
  String? owner;
  String? expireDate;
  List<dynamic>? iconImage;
  String? userId;

  CardModel({
    this.cardId,
    this.gradient,
    this.cardNumber,
    this.cardName,
    this.moneyAmount,
    this.owner,
    this.expireDate,
    this.iconImage,
    this.userId,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    cardId = json['cardId'];
    gradient = json['gradient'];
    cardNumber = json['cardNumber'];
    cardName = json['cardName'];
    moneyAmount = json['moneyAmount'];
    owner = json['owner'];
    expireDate = json['expireDate'];
    iconImage = json['iconImage'];
    userId = json['userId'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cardId'] = cardId;
    map['gradient'] = gradient;
    map['cardNumber'] = cardNumber;
    map['cardName'] = cardName;
    map['moneyAmount'] = moneyAmount;
    map['owner'] = owner;
    map['expireDate'] = expireDate;
    map['iconImage'] = iconImage;
    map['userId'] = userId;
    return map;
  }
}
