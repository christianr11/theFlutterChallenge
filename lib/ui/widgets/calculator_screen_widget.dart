import 'package:flutter/material.dart';

class CalculatorScreenWidget extends StatefulWidget {
  CalculatorScreenWidget({this.equation, this.finalResult});
  final String equation;
  final String finalResult;
  @override
  _CalculatorButtonWidgetState createState() => _CalculatorButtonWidgetState();
}

class _CalculatorButtonWidgetState extends State<CalculatorScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.centerRight,
          child: Text(
            widget.equation,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: Colors.black87),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.centerRight,
          child: Text(
            widget.finalResult,
            style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w700,
                color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
