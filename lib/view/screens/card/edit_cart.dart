
/*

  Created by: Azizbek
  Created on: Jan 29 2023 23:35:23
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:nt/config/config.dart';
import 'package:nt/view/screens/card/constants/color.dart';
import 'package:nt/view/screens/card/widget/card_widget.dart';
import '../../../config/components/toast.dart';
import '../../../models/card_model.dart';
import '../../../models/color_model.dart';
import '../../../services/fire_store_db.dart';

class EditCard extends StatefulWidget {
  final String cardName;
  final String cardUsername;
  final String cardId;
  final List colorL;
  const EditCard(
      {required this.cardName,
      required this.cardUsername,
      required this.cardId,
      required this.colorL,
      super.key});

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardUserController = TextEditingController();

  _sendPost() async {
    String cardName = cardNameController.text.toString().trim();
    String cardUser = cardUserController.text.toString().trim();
    if (cardName.isEmpty || cardUser.isEmpty) return;
    _apiAddPost(
      cardName,
      cardUser,
      widget.cardId,
    );
  }

  _apiAddPost(String name, String user, String cardId) async {
    var card = CardModel(
      cardId: cardId,
      cardName: name,
      gradient: ColorModel.colorMap[0],
    );

    FSDBService.updateCard(card).then((value) => {
          Navigator.of(context).pop({'data': 'succes'}),
          Utils.fireToast('Succes'),
        });
  }

  @override
  void initState() {
    super.initState();
    cardNameController.text = widget.cardName;
    cardUserController.text = widget.cardUsername;
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
                        HexColor(widget.colorL[0]),
                        HexColor(widget.colorL[1]),
                        HexColor(widget.colorL[2]),
                        HexColor(widget.colorL[3]),
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
                CardWidget.textInputter(AppTextStyle.title(),
                    cardNameController, AppStrings.kartanomi),
                CardWidget.textInputter(AppTextStyle.title(),
                    cardUserController, AppStrings.kartaegasi),
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
