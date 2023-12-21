import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'const.dart';

enum BMIResult {
  underweight,
  normal,
  overweight,
}

class BMICalculator {
  BMICalculator({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0.0;

  BMIResult calculateBMI() {
    _bmi = weight / (height * height) * 10000;
    if (_bmi < 18.5) {
      return BMIResult.underweight;
    } else if (_bmi < 25) {
      return BMIResult.normal;
    } else {
      return BMIResult.overweight;
    }
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getBMIResult() {
    return calculateBMI().toString().split('.').last;
  }

  String getBMIMessage() {
    return calculateBMI().toString().split('.').last;
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    required this.bmiCalculator,
    super.key
  });

  final BMICalculator bmiCalculator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
            'Your Result',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    bmiCalculator.getBMIResult(),
                    style: const TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiCalculator.getBMI(),
                    style: const TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiCalculator.getInterpretation(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
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
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: 80.0,
              child: const Center(child: Text("Re-CALCULATE", style: kLargeLabelTextStyle,)),
            ),
          ),            
        ]
      ),
    );
  }
}