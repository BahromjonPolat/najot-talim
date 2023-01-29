/*

  Created by: Azizbek
  Created on: Jan 29 2023 12:00:05
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/
import 'package:card_swiper/card_swiper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nt/view/screens/card/constants/constants.dart';




class CardTask extends StatefulWidget {
  const CardTask({super.key});

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  SingingCharacter? _character = SingingCharacter.one;
 List list = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < 5; i++) {
      widgets.add(
        Container(
          child: Center(
            child: Text(
              list[i],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Методы оплаты'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Column(
            children: [
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: const Card(
                      margin: EdgeInsets.all(0.0),
                      child: Image(
                        image: AssetImage('assets/images/master_card.PNG'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 10,
                itemWidth: MediaQuery.of(context).size.width * 1,
                itemHeight: 250.0,
                layout: SwiperLayout.TINDER,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: RadioListTile<SingingCharacter>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    title: ListTile(
                      minLeadingWidth: 1,
                      leading: ImageIcon(
                       const AssetImage('assets/icons/masc.png'),
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      title: Text(
                        'Кредитная карта',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    activeColor: Theme.of(context).colorScheme.onSurface,
                    value: SingingCharacter.one,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(
                        () {
                          _character = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: RadioListTile<SingingCharacter>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    title: ListTile(
                      minLeadingWidth: 1,
                      leading: ImageIcon(
                        AssetImage('assets/icons/paypc.png'),
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      title: Text(
                        'Paypal',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    activeColor: Theme.of(context).colorScheme.onSurface,
                    value: SingingCharacter.two,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(
                        () {
                          _character = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: RadioListTile<SingingCharacter>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    title: ListTile(
                      minLeadingWidth: 1,
                      leading: ImageIcon(
                   const    AssetImage('assets/icons/paymec.png'),
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      title: Text(
                        'PayMe',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    activeColor: Theme.of(context).colorScheme.onSurface,
                    value: SingingCharacter.three,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(
                        () {
                          _character = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: RadioListTile<SingingCharacter>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    title: ListTile(
                      minLeadingWidth: 1,
                      leading: ImageIcon(
                       const AssetImage('assets/icons/clickc.png'),
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      title: Text(
                        'Click',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    activeColor: Theme.of(context).colorScheme.onSurface,
                    value: SingingCharacter.four,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(
                        () {
                          _character = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: DottedBorder(
                  radius: const Radius.circular(10.0),
                  color: Theme.of(context).canvasColor,
                  strokeWidth: 2,
                  child: ListTile(
                    title: Text(
                      'Добавить метод оплаты',
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
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (contex) {
                            //       return AddPay();
                            //     },
                            //   ),
                            // );
                          },
                          child: ImageIcon(
                          const   AssetImage(
                              'assets/icons/add.png',
                            ),
                            size: 20.0,
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () {},
                      child:const Text(
                        'Еще кнопка',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding:const  EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Theme.of(context).colorScheme.onSurface),
                      onPressed: () {},
                      child:const  Text(
                        'История транзакций',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
