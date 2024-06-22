import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorAppHome(),
    );
  }
}

class CalculatorAppHome extends StatefulWidget {
  const CalculatorAppHome({super.key});

  @override
  State<CalculatorAppHome> createState() => _CalculatorAppHomeState();
}

class _CalculatorAppHomeState extends State<CalculatorAppHome> {
  String equation = '0';
  String result = '0';
  String expression = '';

  // Buttons function
  pressButton(btnText) {
    setState(() {
      if (btnText == 'AC') {
        equation = '0';
        result = '0';
      } else if (btnText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (btnText == '=') {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

      } else {
        if (equation == '0') {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }

  Widget calButtons(String btnText, Color txtColor, double btnWidth, Color btnColor) {
    return InkWell(
      onTap: () {
        pressButton(btnText);
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: btnWidth,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            color: txtColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
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
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 90,
            width: double.infinity,
            color: Colors.grey[900],
            child: Text(
              equation,
              style: TextStyle(color: Colors.greenAccent[100], fontSize: 38),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 90,
            width: double.infinity,
            color: Colors.grey[900],
            child: Text(
              result,
              style: const TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('AC', Colors.black, 80, Colors.redAccent[100]!),
                    calButtons('⌫', Colors.black, 80, Colors.blueGrey[700]!),
                    calButtons('%', Colors.black, 80, Colors.blueGrey[700]!),
                    calButtons('÷', Colors.black, 80, Colors.greenAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('7', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('8', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('9', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('×', Colors.black, 80, Colors.greenAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('4', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('5', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('6', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('-', Colors.black, 80, Colors.greenAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('1', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('2', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('3', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('+', Colors.black, 80, Colors.greenAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('0', Colors.white, 170, Colors.blueGrey[800]!),
                    calButtons('.', Colors.white, 80, Colors.blueGrey[800]!),
                    calButtons('=', Colors.black, 80, Colors.greenAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
