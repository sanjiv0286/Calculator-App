import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

// void main() {
//   runApp(const CalculatorApp());
// }

void main() async {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const CalculatorApp(),
    ),
  );
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _addToExpression(String value) {
    setState(() {
      _expression += value;
    });
  }

  void _clearExpression() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _deleteLastCharacter() {
    setState(() {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  void _evaluateExpression() {
    setState(() {
      try {
        final expression = Parser().parse(_expression);
        final result = expression.evaluate(EvaluationType.REAL, ContextModel());
        _result = result.toString();
      } catch (e) {
        _result = 'Error';
      }
    });
  }

  Widget _buildButton(String buttonText,
      {Color? buttonColor, Color? textColor, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () {
          if (buttonText == '=') {
            _evaluateExpression();
          } else if (buttonText == 'C') {
            _clearExpression();
          } else if (buttonText == '⌫') {
            _deleteLastCharacter();
          } else {
            _addToExpression(buttonText);
          }
        },
        style: ElevatedButton.styleFrom(
          // ignore: deprecated_member_use
          primary: buttonColor ?? Colors.grey[700],
          padding: const EdgeInsets.all(24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    _result,
                    style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('C', buttonColor: Colors.red),
              _buildButton('('),
              _buildButton(')'),
              _buildButton('⌫'),
            ],
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/', textColor: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*', textColor: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-', textColor: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('0', flex: 2),
              _buildButton('.'),
              _buildButton('=', textColor: Colors.orange),
              _buildButton('+', textColor: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}

// *****************************************************************************************

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const CalculatorApp());
// }

// class CalculatorApp extends StatelessWidget {
//   const CalculatorApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Calculator',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CalculatorScreen(),
//     );
//   }
// }

// class CalculatorScreen extends StatefulWidget {
//   const CalculatorScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CalculatorScreenState createState() => _CalculatorScreenState();
// }

// class _CalculatorScreenState extends State<CalculatorScreen> {
//   String _output = '0';
//   double _num1 = 0;
//   double _num2 = 0;
//   String _operator = '';
//   bool _isOperatorClicked = false;

//   void _handleButtonClick(String buttonText) {
//     setState(() {
//       if (buttonText == 'C') {
//         _clearCalculator();
//       } else if (buttonText == '+' ||
//           buttonText == '-' ||
//           buttonText == '*' ||
//           buttonText == '/') {
//         _isOperatorClicked = true;
//         _num1 = double.parse(_output);
//         _operator = buttonText;
//       } else if (buttonText == '=') {
//         _num2 = double.parse(_output);
//         _performCalculation();
//       } else {
//         if (_output == '0' || _isOperatorClicked) {
//           _output = buttonText;
//           _isOperatorClicked = false;
//         } else {
//           _output += buttonText;
//         }
//       }
//     });
//   }

//   void _clearCalculator() {
//     _output = '0';
//     _num1 = 0;
//     _num2 = 0;
//     _operator = '';
//     _isOperatorClicked = false;
//   }

//   void _performCalculation() {
//     switch (_operator) {
//       case '+':
//         _output = (_num1 + _num2).toString();
//         break;
//       case '-':
//         _output = (_num1 - _num2).toString();
//         break;
//       case '*':
//         _output = (_num1 * _num2).toString();
//         break;
//       case '/':
//         if (_num2 != 0) {
//           _output = (_num1 / _num2).toString();
//         } else {
//           _output = 'Error';
//         }
//         break;
//       default:
//         break;
//     }
//     _num1 = 0;
//     _num2 = 0;
//     _operator = '';
//     _isOperatorClicked = false;
//   }

//   Widget _buildButton(String buttonText) {
//     return Expanded(
//       child: ElevatedButton(
//         onPressed: () => _handleButtonClick(buttonText),
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.all(24.0),
//         ),
//         child: Text(
//           buttonText,
//           style: const TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calculator'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             alignment: Alignment.centerRight,
//             padding:
//                 const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
//             child: Text(
//               _output,
//               style:
//                   const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const Expanded(
//             child: Divider(),
//           ),
//           Row(
//             children: [
//               _buildButton('7'),
//               _buildButton('8'),
//               _buildButton('9'),
//               _buildButton('/'),
//             ],
//           ),
//           Row(
//             children: [
//               _buildButton('4'),
//               _buildButton('5'),
//               _buildButton('6'),
//               _buildButton('*'),
//             ],
//           ),
//           Row(
//             children: [
//               _buildButton('1'),
//               _buildButton('2'),
//               _buildButton('3'),
//               _buildButton('-'),
//             ],
//           ),
//           Row(
//             children: [
//               _buildButton('C'),
//               _buildButton('0'),
//               _buildButton('='),
//               _buildButton('+'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
