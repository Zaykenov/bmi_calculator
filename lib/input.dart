import 'package:bmi_calculator/calc_functionality.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableContainer.dart';
import 'ReusableIcon.dart';

const double bottomHeight = 80;
const Color containerColor = Color(0xFF1D1E33);
const Color inactiveColor = Color(0xFF111328);
const Color bottomContainer = Color(0xFFEB1555);
double value = 120;
double weight = 60;
int age = 10;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? slectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      slectedGender = Gender.male;
                    });
                  },
                  child: ReusableContainer(
                    slectedGender == Gender.male
                        ? containerColor
                        : inactiveColor,
                    ReusableIcon(
                      FontAwesomeIcons.mars,
                      'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      slectedGender = Gender.female;
                    });
                  },
                  child: ReusableContainer(
                    slectedGender == Gender.female
                        ? containerColor
                        : inactiveColor,
                    ReusableIcon(
                      FontAwesomeIcons.venus,
                      'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableContainer(
              containerColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'HEIGHT',
                    style: styleText,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '$value cm',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF8D8E98),
                      inactiveTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: value,
                      min: 110.0,
                      max: 200.0,
                      divisions: 10,
                      onChanged: (double newValue) {
                        setState(() {
                          value = newValue;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableContainer(
                  containerColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: styleText,
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                              icon: FontAwesomeIcons.minus,
                              pressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            pressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  containerColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: styleText,
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                              icon: FontAwesomeIcons.minus,
                              pressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            pressed: () {
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
          )),
          GestureDetector(
            onTap: () {
              BMICalculation calc =
                  BMICalculation(height: value, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmiVal: calc.bmiValue(),
                          bmiResult: calc.bmiResult(),
                          bmiRepr: calc.bmiEnterperatation())));
            },
            child: Container(
              color: bottomContainer,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomHeight,
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundButton extends StatefulWidget {
  const RoundButton({required this.icon, required this.pressed});
  final IconData icon;
  final Function pressed;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(widget.icon),
      elevation: 0,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed: () {
        setState(() {
          widget.pressed();
        });
      },
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
    );
  }
}
