import 'package:flutter/material.dart';
import 'constant.dart';
import 'Reusable_card.dart';
import 'bottomButton.dart';

class ResultPage extends StatelessWidget {
final String bmi;
final String bmiResult;
final String bmiInterpretation;

ResultPage({@required this.bmi , @required this.bmiResult, @required this.bmiInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(

              child: Container(padding: EdgeInsets.all(10), child: Text('B M I',style: kBmiTitle,textAlign: TextAlign.center,),),),

          Expanded(
                flex: 5,
                child: RepeatContainer(
                    colour: kactiveCardColour,
                    cardChild: Column(
                      children: <Widget>[
                        Text(bmiResult,style: kresultTitle,textAlign: TextAlign.center,),
                        SizedBox(
                            height: 30,
                            width: 30
                        ),
                        Text(bmi ,style: kresult,),
                        SizedBox(
                          height: 30,
                          width: 30
                        ),
                        Container(padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment(20, 0),
                            child: Text(bmiInterpretation,style: ksuggestion ,))
                      ],
                    ),
                ),
              ),
          BottomButton(buttonName: 'Re-Calculate', buttonAction:  (){
            Navigator.pop(context);},)
        ],

      )
    );
  }
}
