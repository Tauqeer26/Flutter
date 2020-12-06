import 'dart:math';

class BmiBrain{
  BmiBrain({this.height,this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calBrain(){
    _bmi = weight /pow(height/100,2);
    return _bmi.toStringAsFixed(1);

  }

  String getResult(){
    if (_bmi >= 25){
      return 'overweight';
    }else if (_bmi <= 18.5 ){
      return 'Normal';
    }else {
      return 'UnderWeight';
    }

  }
  String getInter(){
    if (_bmi >= 25){
      return 'Your are overweight: Eat less';
    }else if (_bmi <= 18.5 ){
      return 'You are good ';
    }else {
      return 'You are UnderWeight: Eat more';
    }

  }
}