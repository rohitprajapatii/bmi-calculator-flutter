import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusable_card.dart';
import 'cards_icon.dart';
import 'constant.dart';
import 'resultPage.dart';
import 'bottomButton.dart';
import 'bmi_calculation.dart';

enum Gender{
  Male,
  Female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
Gender selectedGender;
int height = 180;
int weight = 60;
int age = 20;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: new RepeatContainer(
                        onPress:(){
                          setState(() {
                            selectedGender = Gender.Male;
                          });
                        },
                        colour: selectedGender == Gender.Male ? kactiveCardColour : kinactiveCardColour,
                        cardChild: new BlockItems(setIcon: FontAwesomeIcons.mars, text: 'Male'),
                    ),
                  ),
                
                Expanded(
                    child: RepeatContainer(
                      onPress:(){
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      colour: selectedGender == Gender.Female ? kactiveCardColour : kinactiveCardColour,
                      cardChild: BlockItems(setIcon: FontAwesomeIcons.venus,text: 'Female',),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
              child: RepeatContainer(
                colour: kactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Height', style: TextStyle(
                      color: kBlockItemsFontColor,
                      fontSize: kBlockItemsFontSize
                    ),),
                    SizedBox(
                      width: 10.0,
                      height: 10.0,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(height.toString(),style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900)),
                        Text('cm',style: TextStyle(
                          color: kBlockItemsFontColor,
                          fontSize: 15.0,
                        ),),

                      ],
                    ),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        activeTrackColor:Colors.white ,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555),
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15) ,
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                      ),
                      child: Slider(
                        min: 100,
                        max: 500,
                        value: height.toDouble(),
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RepeatContainer(
                    colour: kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Weight', style: TextStyle(
                          color: kBlockItemsFontColor,
                          fontSize: kBlockItemsFontSize
                        ),
                        ),
                        SizedBox(
                          width: 10.0,
                          height: 10.0,
                        ),
                        Text(weight.toString(), style: TextStyle(
                            color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 35.0
                        ),),
                        SizedBox(
                          width: 10.0,
                        height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              calculate: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),

                            SizedBox(
                              width: 10.0,
                                height: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              calculate: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ),

                Expanded(
                  flex: 1,
                  child: RepeatContainer(
                    colour:kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Age', style: TextStyle(
                            color: kBlockItemsFontColor,
                            fontSize: kBlockItemsFontSize
                        ),
                        ),
                        SizedBox(
                          width: 10.0,
                          height: 10.0,
                        ),
                        Text(age.toString(), style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 35.0
                        ),),
                        SizedBox(
                          width: 10.0,
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              calculate: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),

                            SizedBox(
                              width: 10.0,
                              height: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              calculate: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new BottomButton(buttonName: 'Calculate', buttonAction:  (){
            BmiCalculation calc = BmiCalculation(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              bmi: calc.calculateBmi(),
              bmiResult: calc.getResult(),
              bmiInterpretation: calc.getInterpretation(),
            )),
            );},),
        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.calculate});
  final IconData icon;
  final Function calculate;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: calculate,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Icon(icon),
      fillColor: kBlockItemsFontColor,
      constraints: BoxConstraints(minHeight: 50.0, minWidth: 50.0),

      ) ;
  }
}