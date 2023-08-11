import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0";
  String _output = "0";

  double num1 = 0.0;

  double num2 = 0.0;

  String operand = "";

  operation(String btntext) {
    if (btntext == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "X" ||
        btntext == "/") {
      num1 = double.parse(output);
      operand = btntext;
      _output = "0";
    } else if (btntext == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + btntext;
    }
    // setState(() {
    //   output = double.parse(_output).toStringAsFixed(2);
    // });
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String btntext) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(
          color: Colors.black,
          width: 2,
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        fillColor: Colors.black12,
        // padding: const EdgeInsets.only(),
        padding: const EdgeInsets.all(25),
        splashColor: Colors.black,
        child: Text(
          btntext,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          operation(btntext);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "First App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
          backgroundColor: Colors.black12,
        ),
        // ignore: avoid_unnecessary_containers
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black12,
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      //*************const*********** */
                      output, //****************"$output"******************* */
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    button("9"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("8"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("7"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("/"),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    button("4"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("5"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("6"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("X"),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    button("1"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("2"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("3"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("-"),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    button("0"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("C"),
                    const SizedBox(
                      width: 5,
                    ),
                    button("="),
                    const SizedBox(
                      width: 5,
                    ),
                    button("+"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
