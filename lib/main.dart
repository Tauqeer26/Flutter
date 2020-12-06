import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_cont.dart';
import 'Reuse_card.dart';
import 'results_page.dart';
import 'BMIBrain.dart';

const bottContHei=80.0;
const activeColor= Colors.grey;
const inactiveColor= Colors.black45;

const kNumberStyle = TextStyle(
  fontSize: 60.0,
  fontWeight: FontWeight.w900,
  //color: Colors.black
);



enum Gender{
  male,
  female,
}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedG;
  int height =180;
  int weight =60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),

      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuseCard(
                      onPress: (){
                        setState(() {
                          selectedG=Gender.female;
                        });
                      },
                      colour: selectedG ==Gender.male? activeColor:inactiveColor,
                      cardchild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                  ),
                ),


                Expanded(
                  child: ResuseCard(
                    onPress: (){
                      setState(() {
                        selectedG = Gender.male;
                      });
                    },
                      colour: selectedG ==Gender.female? activeColor:inactiveColor,
                      cardchild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                  ),
                ),


              ],
            ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                child: ResuseCard(
                    colour: activeColor,
                  cardchild: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                      style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('cm',
                            style:TextStyle(
                                fontSize: 18.0,
                                color: Colors.black
                            ),

                          ),
                          Text(
                            height.toString(),
                            style:kNumberStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          //thumbColor: Colors.blueGrey,
                          //activeTrackColor: Colors.white,
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(value: height.toDouble(),
                            min: 100.0,
                            max: 250.0,
                            activeColor: Colors.white,
                            inactiveColor: Colors.white12,
                            onChanged: (double newValue){
                                setState(() {
                                  height=newValue.round();
                                });

                            },
                            ),
                      ),


                    ],
                  ),
                ),
              )
            ],

          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Row(
                children: [
                  Expanded(
                    child: ResuseCard(
                        colour: activeColor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Text(weight.toString(),
                          style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                              setState(() {
                                weight++;
                              },
                              );
                              },
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  },
                                  );
                                },
                              ),
                            ],
                          ),



                        ],
                      ),


                    ),
                        
                  ),

                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(child: ResuseCard(
                      colour: activeColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'AGE',style: TextStyle(
                          fontSize: 20.0,
                        ),
                        ),
                        Text(age.toString(),
                          style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                     setState(() {
                                     age ++;
                                     },
                                     );
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age --;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ),
                ],
              ))
            ],
          ),
          ),
          BottomButton(onTap: (){

               BmiBrain calu= BmiBrain(height:height, weight:weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
                  resulttext: calu.calBrain(),
                  bmiText: calu.getResult(),
                  interpretation: calu.getInter(),

              ),
                ),
              );
            },
            name: 'CALCULATE'
          ),
          //Expanded(child: null),

        ],
      ),

    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.name,@required this.onTap});

  final Function onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        color: Colors.blueGrey,
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: bottContHei,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon,this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.black26,
    );
  }
}



