import 'package:flutter/material.dart';
import 'constant.dart';

class BlockItems extends StatelessWidget {
  BlockItems({@required this.setIcon, this.text});
  final IconData setIcon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(setIcon,size: 70),
        SizedBox(
          width: 20,
          height: 20,
        ),
        Text(text,style: TextStyle(
            fontSize: kBlockItemsFontSize,
            color: kBlockItemsFontColor,
          fontWeight: FontWeight.w300
        ),),
      ],
    );
  }
}