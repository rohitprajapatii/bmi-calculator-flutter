import 'dart:math';


class BmiCalculation{
  BmiCalculation({this.height, this.weight});
  final int weight;
  final int height;
  double _bmi;
  String calculateBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){

      return 'Overweight 🐘';
    }
    else if(_bmi > 18.5){
      return 'Healthy 👌';
    }
    else{
      return 'Underweight ☹';
   }
  }

  String getInterpretation(){
    if(_bmi <18.5){
      return 'Too skinny. you should eat more';
    }
    else if(_bmi >= 18.5 && _bmi <= 24){
      return 'Seems like You are already healthy . Just keep it up ✌';
    }
    else{
      return 'You are Unhealthy. You should eat less and focus on exercise';
    }
  }
}