import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Reuse_card.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.resulttext,@required this.bmiText,@required this.interpretation});

    final String resulttext;
    final String bmiText;
    final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0) ,
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
                ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ResuseCard(colour: Colors.black45,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Text(resulttext,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  Text(bmiText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),

                  ),
                  SizedBox(width: 10.0,),
                  Text(interpretation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,

                  ),
                  ),
                ],

              ),
              ),

          ),
          BottomButton(name: 'RE-CALCULATE', onTap:(){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
