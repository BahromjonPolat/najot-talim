import 'package:flutter/material.dart';

class DetailsItemWidget extends StatelessWidget {
  String title;
  String trailing;
   DetailsItemWidget({
    Key? key,
    required this.title,
    required this.trailing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,),
        Text(trailing),
      ],
    );
  }
}
