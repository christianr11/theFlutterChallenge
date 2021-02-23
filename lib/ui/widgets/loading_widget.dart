import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      height: 70.0,
      width: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black87,
      ),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
