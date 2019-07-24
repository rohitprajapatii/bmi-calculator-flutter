import 'package:flutter/material.dart';
import 'constant.dart';
//import 'resultPage.dart';
class BottomButton extends StatelessWidget {
BottomButton({@required this.buttonName, this.buttonAction});
final String buttonName;
final Function buttonAction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonAction,
      child: Container (
        margin: EdgeInsets.only(top: 10.0),
        height: kbottomContainerHeight,
        width: double.infinity,
        color: kBottomButtonColour,
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
                letterSpacing: 2,
                color: Color(0xFFFFFFFF),
                fontSize: 25,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
