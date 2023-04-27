import 'package:flutter/material.dart';
import 'input.dart';
import 'result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => InputPage(),
        },
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ));
  }
}
