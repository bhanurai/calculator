import 'package:calculator/calculator.dart';
import 'package:calculator/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: getApplicationTheme(),
      home: const CalculatorBody(),
    );
  }
}
