import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:nt/config/config.dart';
import 'package:nt/view/screens/card/constants/color.dart';
import 'package:nt/view/screens/card/widget/app_dialog.dart';
import 'package:nt/view/screens/card/widget/buttons.dart';
import 'package:nt/view/screens/card/widget/card_widget.dart';

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
    'FF429A8A',
    'FF4563DB',
    'FF5036D5',
    'FFFF8787',
  ];
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardUserController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();
  CardDetails? cardDetail;
  final GlobalKey<FormState> _formKey = GlobalKey();
  int gradientindex = 0;
  bool check = false;
  int currentIndex = 0;
  _sendPost(int a) async {
    String cardNumber = cardNumberController.text.toString().trim();
    String cardDate = cardDateController.text.toString().trim();
    String cardName = cardNameController.text.toString().trim();
    String cardUser = cardUserController.text.toString().trim();
    String cardType = cardTypeController.text.toString().trim();
    int colorIndex = a;

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
      colorIndex,
    );
  }

  _apiAddPost(String number, String date, String name, String user, String type,
      int gradientindex) async {
    String id = const Uuid().v4();

    var card = CardModel(
      cardId: id,
      cardName: name,
      cardNumber: number,
      expireDate: date,
      gradient: ColorModel.colorMap[gradientindex],
      iconImage: [1, 2, 2, 2, 2],
      // iconImage: PicToBytes.picToBytes(),
      moneyAmount: type,
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
          height: MediaQuery.of(context).size.height * 1.1,
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
                        HexColor(ColorModel.colorMap[currentIndex]![0]),
                        HexColor(ColorModel.colorMap[currentIndex]![1]),
                        HexColor(ColorModel.colorMap[currentIndex]![2]),
                        HexColor(ColorModel.colorMap[currentIndex]![3]),
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
                        itemCount: ColorModel.colorMap.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  print(index);
                                  print(currentIndex);
                                  currentIndex = index;
                                  print(currentIndex);
                                });
                              },
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        colors: [
                                          HexColor(
                                              ColorModel.colorMap[index]![0]),
                                          HexColor(
                                              ColorModel.colorMap[index]![1]),
                                          HexColor(
                                              ColorModel.colorMap[index]![2]),
                                          HexColor(
                                              ColorModel.colorMap[index]![3]),
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
                                  currentIndex == index
                                      ? const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.check,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(''),
                                ],
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    AppStrings.kartaturi,
                    style: AppTextStyle.title().copyWith(fontSize: 16),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: AppInputField(
                    controller: cardTypeController,
                    hint: AppStrings.kartaturi,
                    readOnly: true,
                    validator: (v) =>
                        v!.isEmpty ? AppStrings.pleaseSelectCard : null,
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                    onTap: () {
                      AppDialog dialog = AppDialog(context);

                      dialog.showCupertinoModalSheet(
                          actions: [_setAction(), _setAction2()]);
                    },
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (cardNumberController.text.isNotEmpty ||
                        cardDateController.text.isNotEmpty ||
                        cardNameController.text.isNotEmpty ||
                        cardUserController.text.isNotEmpty ||
                        cardTypeController.text.isNotEmpty) {
                      if (_formKey.currentState!.validate()) {
                        _sendPost(currentIndex);
                      }
                    } else {
                      Utils.fireToast(
                          'Iltimos ma`lumotlarni to`liq to`ldiring ');
                    }
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

  AppCupertinoAction _setAction() => AppCupertinoAction(
        label: 'humo',
        isDefault: true,
        onPressed: () {
          cardTypeController.text = 'humo';
          AppNavigator.pop();
        },
      );

  AppCupertinoAction _setAction2() => AppCupertinoAction(
        label: 'uzcard',
        isDefault: true,
        onPressed: () {
          cardTypeController.text = 'uzcard';
          AppNavigator.pop();
        },
      );
}
