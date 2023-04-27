import 'dart:math';

class BMICalculation {
  final double height;
  final double weight;
  BMICalculation({required this.height, required this.weight});

  late double _bmi;
  double initState() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

  String bmiValue() {
    return initState().toStringAsFixed(1);
  }

  String bmiResult() {
    if (initState() >= 25) {
      return "Overweight";
    } else if (initState() >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String bmiEnterperatation() {
    if (initState() >= 25) {
      return "You have high body weight please exercise more";
    } else if (initState() >= 18.5) {
      return "You have normal body weight! You are in great shape!";
    } else {
      return "You have low body weight. Eat more food bruh!";
    }
  }
}
