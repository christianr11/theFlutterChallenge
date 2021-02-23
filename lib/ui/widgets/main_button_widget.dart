import 'package:flutter/material.dart';

class MainButtonWidget extends StatefulWidget {
  MainButtonWidget({this.title, this.width, this.height});
  final String title;
  final double width;
  final double height;

  @override
  _MainButtonWidgetState createState() => _MainButtonWidgetState();
}

class _MainButtonWidgetState extends State<MainButtonWidget> {
  @override
  Widget build(Object context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: Text(
          "${widget.title}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
