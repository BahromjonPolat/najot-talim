import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:nt/config/config.dart';
import 'package:nt/view/screens/card/constants/color.dart';
import 'package:nt/view/screens/card/widget/card_widget.dart';
import 'package:nt/view/screens/card/widget/imei.dart';
import 'package:nt/view/screens/card/widget/pic_to_bytes.dart';
import 'package:uuid/uuid.dart';

import '../../../config/components/toast.dart';
import '../../../models/card_model.dart';
import '../../../models/color_model.dart';
import '../../../services/fire_store_db.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  List list = [
    'FF3594DD',
    'FF4563DB',
    'FF5036D5',
    'FF5B16D0',
  ];
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardUserController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();
  CardDetails? cardDetail;
  // CardScanOptions scanOptions = const CardScanOptions(
  //   scanCardHolderName: true,
  //   initialScansToDrop: 0,
  //   considerPastDatesInExpiryDateScan: true,
  //   validCardsToScanBeforeFinishingScan: 0,
  //   maxCardHolderNameLength: 30,
  // );

  // Future<void> scanCard() async {
  //   var cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
  //   if (!mounted) return;
  //   setState(() {
  //     cardDetail = cardDetails;
  //     cardNumbers = cardDetail!.cardNumber;
  //     cardDates = cardDetail!.expiryDate;
  //     cardNames = cardDetail!.cardHolderName;
  //   });
  // }

  String cardNumbers = '';
  String cardDates = '';
  String cardNames = '';

  _sendPost() async {
    String cardNumber = cardNumberController.text.toString().trim();
    String cardDate = cardDateController.text.toString().trim();
    String cardName = cardNameController.text.toString().trim();
    String cardUser = cardUserController.text.toString().trim();
    String cardType = cardTypeController.text.toString().trim();

    if (cardNumber.isEmpty ||
        cardDate.isEmpty ||
        cardName.isEmpty ||
        cardUser.isEmpty ||
        cardType.isEmpty) return;
    _apiAddPost(
      cardNumber,
      cardDate,
      cardName,
      cardUser,
      cardType,
    );
  }

  _apiAddPost(
      String number, String date, String name, String user, String type) async {
    String id = const Uuid().v4();
    var card = CardModel(
      cardId: id,
      cardName: name,
      cardNumber: number,
      expireDate: date,
      gradient: ColorModel.colorMap[0],
      iconImage: [1, 2, 2, 2, 2],
      // iconImage: PicToBytes.picToBytes(),
      moneyAmount: '',
      owner: user,
      userId: "123",
      // userId: userIiid['serial'],
    );

    FSDBService.creatCard(card).then((value) => {
          Navigator.of(context).pop({'data': 'succes'}),
          Utils.fireToast('Succes'),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Добавит способы оплаты')),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 500.0,
                  height: 220.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        HexColor(list[0]),
                        HexColor(list[1]),
                        HexColor(list[2]),
                        HexColor(list[3]),
                      ],
                      stops: const [
                        0.1,
                        0.4,
                        0.7,
                        0.9,
                      ],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      tileMode: TileMode.repeated,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 60.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor(ColorModel.colorMap[index]![0]),
                                    HexColor(ColorModel.colorMap[index]![1]),
                                    HexColor(ColorModel.colorMap[index]![2]),
                                    HexColor(ColorModel.colorMap[index]![3]),
                                  ],
                                  stops: const [
                                    0.1,
                                    0.4,
                                    0.7,
                                    0.9,
                                  ],
                                  begin: FractionalOffset.centerLeft,
                                  end: FractionalOffset.centerRight,
                                  tileMode: TileMode.repeated,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CardWidget.textInputter(
                        AppTextStyle.title(),
                        cardNumberController,
                        AppStrings.kartaraqami,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () async {
                          // scanCard();
                        },
                        icon: const Icon(
                          Icons.document_scanner_outlined,
                          color: Color(0xff429A8A),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                CardWidget.textInputter(AppTextStyle.title(),
                    cardDateController, AppStrings.muddati),
                CardWidget.textInputter(AppTextStyle.title(),
                    cardNameController, AppStrings.kartanomi),
                CardWidget.textInputter(AppTextStyle.title(),
                    cardUserController, AppStrings.kartaegasi),
                CardWidget.textInputter(AppTextStyle.title(),
                    cardTypeController, AppStrings.kartaturi),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    _sendPost();
                  },
                  child: Text(
                    'Сохранить',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}