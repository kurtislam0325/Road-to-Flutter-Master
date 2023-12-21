import 'package:flutter/material.dart';
import './input_page.dart';
import './results_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: const Color.fromRGBO(10, 14, 33, 1),
          onSurface: Colors.white,
          background: const Color.fromRGBO(10, 14, 33, 1),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
          thumbColor: const Color(0xFFEB1555),
          overlayColor: const Color(0x29EB1555),
          activeTrackColor: Colors.white,
          inactiveTrackColor: const Color(0xFF8D8E98),
        ),
      ),
      home: const InputPage(),
    );
  }
}


