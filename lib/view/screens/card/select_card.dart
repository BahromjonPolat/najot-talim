/*

  Created by: Azizbek
  Created on: Jan 29 2023 12:00:05
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nt/config/config.dart';
import 'package:nt/models/card_model.dart';
import 'package:nt/services/fire_store_db.dart';
import 'package:nt/view/screens/card/constants/color.dart';
import 'package:nt/view/screens/card/edit_cart.dart';
import 'package:nt/view/screens/card/widget/app_dialog.dart';
import 'package:nt/view/screens/card/widget/card_widget.dart';

class SelectCard extends StatefulWidget {
  const SelectCard({super.key});

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  List listColor = [
    'FF3594DD',
    'FF4563DB',
    'FF5036D5',
    'FF5B16D0',
  ];
  late AppDialog appDialog;
  @override
  void initState() {
    super.initState();
    appDialog = AppDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.pushNamed(RouteNames.addCard);
        },
      ),
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(AppStrings.edit),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 2,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Column(
              children: [
                StreamBuilder(
                  stream: FSDBService.getCard('123'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CardModel> cardModel = snapshot.requireData.docs
                          .toList()
                          .map((e) => CardModel.fromJson(e.data()))
                          .toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cardModel.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    width: 500.0,
                                    height: 220.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        colors: [
                                          HexColor(
                                              cardModel[index].gradient![0]),
                                          HexColor(
                                              cardModel[index].gradient![1]),
                                          HexColor(
                                              cardModel[index].gradient![2]),
                                          HexColor(
                                              cardModel[index].gradient![3]),
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CardWidget.cardInfo(
                                            cardModel[index]
                                                .cardNumber
                                                .toString(),
                                          ),
                                          CardWidget.cardInfo(
                                            cardModel[index]
                                                .expireDate
                                                .toString(),
                                          ),
                                          CardWidget.cardInfo(
                                            cardModel[index]
                                                .cardName
                                                .toString(),
                                          ),
                                          CardWidget.cardInfo(
                                            cardModel[index].owner.toString(),
                                          ),
                                          CardWidget.cardInfo(
                                            cardModel[index]
                                                .moneyAmount
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return EditCard(
                                                  cardName: cardModel[index]
                                                      .cardName
                                                      .toString(),
                                                  cardUsername: cardModel[index]
                                                      .owner
                                                      .toString(),
                                                  cardId:
                                                      cardModel[index].cardId!,
                                                  colorL: cardModel[index]
                                                      .gradient!,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                        color: const Color(0xff429A8A),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          appDialog.showSimpleDialog(
                                              title: AppStrings.delete,
                                              contentText: AppStrings.warning,
                                              onYesPressed: () async {
                                                await FSDBService.deleteCard(
                                                    cardModel[index].cardId!);
                                                AppNavigator.pop();
                                              },
                                              onCancelPressed: () {
                                                Navigator.pop(context);
                                              });
                                        },
                                        icon: const Icon(Icons.delete),
                                        color: const Color(0xff429A8A),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Text('123');
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: DottedBorder(
                    radius: const Radius.circular(10.0),
                    color: const Color.fromRGBO(158, 158, 158, 1),
                    strokeWidth: 1,
                    child: ListTile(
                      title: Text(
                        'Add Card',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child: FloatingActionButton(
                              elevation: 2.0,
                              mini: true,
                              backgroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              onPressed: () {
                                AppNavigator.pushNamed(RouteNames.addCard);
                              },
                              child: const Icon(Icons.add)),
                        ),
                      ),
                    ),
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
