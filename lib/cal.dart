import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCalculator(),
    ),
  );
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  MyCalculatorState createState() => MyCalculatorState();
}

class MyCalculatorState extends State<MyCalculator> {
  String resultOutput = "0";
  String _resultOutput = "0";
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  String operandOperator = "";

  void _buttonPressed(String btnTxt) {
    if (btnTxt == "CLEAR") {
      _resultOutput = "0";
      firstNumber = 0.0;
      secondNumber = 0.0;
      operandOperator = "";
    } else if (btnTxt == "+" ||
        btnTxt == "-" ||
        btnTxt == "/" ||
        btnTxt == "X") {
      firstNumber = double.parse(resultOutput);
      operandOperator = btnTxt;
      _resultOutput = "0";
    } else if (btnTxt == ".") {
      if (_resultOutput.contains(".")) {
        if (kDebugMode) {
          print("Already contains a decimals");
        }
        return;
      } else {
        _resultOutput = _resultOutput + btnTxt;
      }
    } else if (btnTxt == "=") {
      secondNumber = double.parse(resultOutput);
      if (operandOperator == "+") {
        _resultOutput = (firstNumber + secondNumber).toString();
      }
      if (operandOperator == "-") {
        _resultOutput = (firstNumber - secondNumber).toString();
      }
      if (operandOperator == "X") {
        _resultOutput = (firstNumber * secondNumber).toString();
      }
      if (operandOperator == "/") {
        _resultOutput = (firstNumber / secondNumber).toString();
      }
      firstNumber = 0.0;
      secondNumber = 0.0;
      operandOperator = "";
    } else {
      _resultOutput = _resultOutput + btnTxt;
    }

    setState(() {
      resultOutput = double.parse(_resultOutput).toStringAsFixed(2);
    });
  }

  Widget calculatorButtonFactory(String btnTxt) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
            backgroundColor: Colors.blueGrey),
        child: Text(
          btnTxt,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.normal),
        ),
        onPressed: () => _buttonPressed(btnTxt),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text("My Calculator"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              resultOutput,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  calculatorButtonFactory("7"),
                  calculatorButtonFactory("8"),
                  calculatorButtonFactory("9"),
                  calculatorButtonFactory("/"),
                ],
              ),
              Row(
                children: [
                  calculatorButtonFactory("4"),
                  calculatorButtonFactory("5"),
                  calculatorButtonFactory("6"),
                  calculatorButtonFactory("X"),
                ],
              ),
              Row(
                children: [
                  calculatorButtonFactory("1"),
                  calculatorButtonFactory("2"),
                  calculatorButtonFactory("3"),
                  calculatorButtonFactory("-"),
                ],
              ),
              Row(
                children: [
                  calculatorButtonFactory("."),
                  calculatorButtonFactory("0"),
                  calculatorButtonFactory("00"),
                  calculatorButtonFactory("+"),
                ],
              ),
              Row(
                children: [
                  calculatorButtonFactory("CLEAR"),
                  calculatorButtonFactory("="),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
