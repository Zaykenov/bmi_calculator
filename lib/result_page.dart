import 'package:bmi_calculator/ReusableContainer.dart';
import 'package:bmi_calculator/input.dart';
import 'package:flutter/material.dart';
import 'calc_functionality.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.bmiVal, required this.bmiResult, required this.bmiRepr});
  final String bmiVal;
  final String bmiResult;
  final String bmiRepr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ReusableContainer(
              containerColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24D876),
                    ),
                  ),
                  Text(
                    bmiVal,
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiRepr,
                    style: TextStyle(
                      fontSize: 21,
                      color: Color(0xFF8D8E98),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: bottomContainer,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomHeight,
              child: Center(
                child: Text(
                  'Recalculate',
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
