import 'package:flutter/material.dart';
import 'package:flutterChallenge/ui/widgets/calculator_button_widget.dart';
import 'package:flutterChallenge/ui/widgets/calculator_screen_widget.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String cFormula = "";
  String finalResult = "0";

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  selectedButton(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        finalResult = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        cFormula = equation;
        cFormula = cFormula.replaceAll('÷', '/');
        cFormula = cFormula.replaceAll('×', '*');

        for (int i = 0; i < cFormula.length; i++) {
          if (cFormula[i] == "(" && i != 0) {
            if (_isNumeric(cFormula[i - 1])) {
              String exp1 = cFormula.substring(0, i);
              String exp2 = cFormula.substring(i);
              cFormula = "$exp1*$exp2";
            }
          }
        }

        try {
          Parser p = Parser();
          Expression exp = p.parse(cFormula);
          ContextModel cm = ContextModel();

          finalResult = "${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (e) {
          finalResult = "Error invalid format: $cFormula";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          String ltext = equation.substring(equation.length - 1);
          if (ltext == ")" && _isNumeric(buttonText)) {
            equation = equation + "×" + buttonText;
          } else {
            equation = equation + buttonText;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CalculatorScreenWidget(
              equation: equation,
              finalResult: finalResult,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Table(
                      children: [
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "C",
                            buttonColor: Colors.orange[100],
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "(",
                            buttonColor: Color(0xffbcdfff),
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: ")",
                            buttonColor: Color(0xffbcdfff),
                            selectedButton: selectedButton,
                          ),
                        ]),
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "7",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "8",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "9",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                        ]),
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "4",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "5",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "6",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                        ]),
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "1",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "2",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "3",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                        ]),
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: ".",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "0",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                          CalculatorButtonWidget(
                            buttonText: "⌫",
                            buttonColor: Colors.white,
                            selectedButton: selectedButton,
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Table(
                      children: [
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "÷",
                            buttonColor: Color(0xffbcdfff),
                            selectedButton: selectedButton,
                          ),
                        ]),
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "×",
                            buttonColor: Color(0xffbcdfff),
                            selectedButton: selectedButton,
                          ),
                        ]),
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "-",
                            buttonColor: Color(0xffbcdfff),
                            selectedButton: selectedButton,
                          ),
                        ]),
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "+",
                            buttonColor: Color(0xffbcdfff),
                            selectedButton: selectedButton,
                          ),
                        ]),
                        TableRow(children: [
                          CalculatorButtonWidget(
                            buttonText: "=",
                            buttonColor: Colors.orange[100],
                            selectedButton: selectedButton,
                          ),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
