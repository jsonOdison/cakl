import 'package:cal/globalconstant.dart';
import 'package:cal/widgets/myroundbutton.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double first = 0;
  double second = 0;
  double result = 0;
  String input = '';
  String doWhat = '';
  @override
  Widget build(BuildContext context) {
    void acceptNumber(int num) {
      setState(() {
        input = num.toString();
        if (doWhat == '') {
          first = double.parse(input);
        } else {
          second = double.parse(input);
          // first = result;
        }
      });
    }

    void calculate(String operator) {
      if (doWhat == '') {
        doWhat = operator;
        return;
      }
      switch (doWhat) {
        case '*':
          setState(() {
            result = first * second;
            first = result;
            doWhat = operator;
          });
          break;
        case '+':
          setState(() {
            result = first + second;
            doWhat = operator;
          });
          break;
        case '/':
          if (second == 0) return;
          setState(() {
            result = first + second;
            doWhat = operator;
          });
          break;
        default:
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: Text(
            result.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 75),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: Text(
            input,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyRoundButton(
              label: 'AC',
              color: colorGreyButton,
              fontsize: 20,
              textColor: Colors.black,
              onTab: () {
                setState(() {
                  input = '';
                  result = 0;
                  first = 0;
                  second = 0;
                  doWhat = '';
                });
              },
            ),
            MyRoundButton(
              label: '+/-',
              color: colorGreyButton,
              fontsize: 20,
              textColor: Colors.black,
              onTab: () {
                print('7');
              },
            ),
            MyRoundButton(
              label: '%',
              color: colorGreyButton,
              textColor: Colors.black,
              onTab: () {
                print('7');
              },
            ),
            MyRoundButton(
              label: '/',
              color: Colors.orangeAccent,
              onTab: () {
                calculate('/');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyRoundButton(
              label: '7',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(7);
              },
            ),
            MyRoundButton(
              label: '4',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(4);
              },
            ),
            MyRoundButton(
              label: '9',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(9);
              },
            ),
            MyRoundButton(
              label: '*',
              color: Colors.orangeAccent,
              onTab: () {
                calculate('*');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyRoundButton(
              label: '4',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(4);
              },
            ),
            MyRoundButton(
              label: '5',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(5);
              },
            ),
            MyRoundButton(
              label: '6',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(6);
              },
            ),
            MyRoundButton(
              label: '-',
              color: Colors.orangeAccent,
              onTab: () {
                print('7');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyRoundButton(
              label: '3',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(3);
              },
            ),
            MyRoundButton(
              label: '2',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(2);
              },
            ),
            MyRoundButton(
              label: '1',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(1);
              },
            ),
            MyRoundButton(
              label: '+',
              color: Colors.orangeAccent,
              onTab: () {
                calculate('+');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //MyRectangleButton(label: '0', color: colorDarkButton),
            MyRoundButton(
              label: '0',
              color: colorDarkButton,
              onTab: () {
                acceptNumber(0);
              },
            ),
            MyRoundButton(
              label: 'Del',
              color: colorDarkButton,
              onTab: () {
                setState(() {
                  input = input.substring(0, input.length - 1);
                });
              },
            ),
            MyRoundButton(
              label: '.',
              color: colorDarkButton,
              onTab: () {
                print('7');
              },
            ),
            MyRoundButton(
              label: '=',
              color: Colors.orangeAccent,
              onTab: () {
                print('7');
              },
            ),
          ],
        ),
      ]),
    );
  }
}
