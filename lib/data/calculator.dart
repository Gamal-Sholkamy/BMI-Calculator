import 'dart:math';

class Calculator{
  final int height;
  final int weight;
  double? _bmi;
  Calculator({required this.height,required this.weight});
  String calculateBMI(){
     _bmi=weight/pow(height/100, 2);
    return _bmi!.toStringAsFixed(1);
  }
  String getFinalState(){
    if(_bmi!>=25){
      return "Over Weight";
    }
    else if(_bmi!>18.5){
      return "Normal";

    }
    else {
      return "Under Weight";

    }
  }
  String getFinalFeedback(){
    if(_bmi!>=25){
      return "you have higher than normal in Weight, try to do sport";
    }
    else if(_bmi!>18.5){
      return "you are in the normal Weight, Good Work";

    }
    else {
      return "you have lower than normal in Weight, try to eat more !";

    }
  }

}