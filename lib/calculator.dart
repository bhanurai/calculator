import 'package:flutter/material.dart';

class CalculatorBody extends StatefulWidget {
  const CalculatorBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  String currentExpression = '';

  void handleButtonPress(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        evaluateExpression();
      } else if (buttonText == 'AC') {
        clearExpression();
      } else if (buttonText == '%') {
        calculatePercentage();
      } else if (buttonText == '⌫') {
        removeLastDigit();
      } else {
        currentExpression += buttonText;
      }
    });
  }

  void evaluateExpression() {
    try {
      List<String> parts = currentExpression.split(RegExp(r'[+\-*/]'));

      if (parts.length > 2) {
        currentExpression = '0';
      } else {
        double result = 0;

        if (currentExpression.contains('+')) {
          result = double.parse(parts[0]) + double.parse(parts[1]);
        } else if (currentExpression.contains('-')) {
          result = double.parse(parts[0]) - double.parse(parts[1]);
        } else if (currentExpression.contains('*')) {
          result = double.parse(parts[0]) * double.parse(parts[1]);
        } else if (currentExpression.contains('/')) {
          result = double.parse(parts[0]) / double.parse(parts[1]);
        }

        currentExpression = result.toString();
      }
    } catch (e) {
      currentExpression = 'Error';
    }
  }

  void clearExpression() {
    setState(() {
      currentExpression = '';
    });
  }

  void calculatePercentage() {
    setState(() {
      if (currentExpression.isNotEmpty) {
        double percentage = double.parse(currentExpression) / 100;
        currentExpression = percentage.toString();
      }
    });
  }

  void removeLastDigit() {
    setState(() {
      if (currentExpression.isNotEmpty) {
        currentExpression =
            currentExpression.substring(0, currentExpression.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Calculator App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorDisplay(expression: currentExpression),
              const SizedBox(height: 5),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    String buttonText;
                    switch (index) {
                      case 0:
                        buttonText = '0';
                        break;
                      case 1:
                        buttonText = '/';
                        break;
                      case 2:
                        buttonText = '%';
                        break;
                      case 3:
                        buttonText = '*';
                        break;
                      case 4:
                        buttonText = '7';
                        break;
                      case 5:
                        buttonText = '8';
                        break;
                      case 6:
                        buttonText = '9';
                        break;
                      case 7:
                        buttonText = '-';
                        break;
                      case 8:
                        buttonText = '4';
                        break;
                      case 9:
                        buttonText = '5';
                        break;
                      case 10:
                        buttonText = '6';
                        break;
                      case 11:
                        buttonText = '+';
                        break;
                      case 12:
                        buttonText = '1';
                        break;
                      case 13:
                        buttonText = '2';
                        break;
                      case 14:
                        buttonText = '3';
                        break;
                      case 15:
                        buttonText = '=';
                        break;
                      case 16:
                        buttonText = 'AC';
                        break;
                      case 17:
                        buttonText = '⌫';
                        break;
                      case 18:
                        buttonText = '.';
                        break;
                      default:
                        buttonText = '';
                    }

                    return CalculatorButton(
                      text: buttonText,
                      onPressed: () => handleButtonPress(buttonText),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  final String expression;

  const CalculatorDisplay({Key? key, required this.expression})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue[900],
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          expression,
          style: const TextStyle(fontSize: 24, height: 8, color: Colors.white),
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CalculatorButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[900],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
