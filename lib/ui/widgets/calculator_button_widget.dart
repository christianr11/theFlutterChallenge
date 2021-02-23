import 'package:flutter/material.dart';

typedef MyEventCallback = Function(String buttonText);

class CalculatorButtonWidget extends StatefulWidget {
  CalculatorButtonWidget(
      {this.buttonText, this.selectedButton, this.buttonColor});

  final String buttonText;
  final MyEventCallback selectedButton;
  final Color buttonColor;
  @override
  _CalculatorButtonWidgetState createState() => _CalculatorButtonWidgetState();
}

class _CalculatorButtonWidgetState extends State<CalculatorButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selectedButton(widget.buttonText);
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
