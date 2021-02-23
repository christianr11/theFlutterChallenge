import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIconsWidget extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(100.0)),
            child: Icon(
              FontAwesomeIcons.facebookF,
              size: 14.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(100.0)),
            child: Icon(
              FontAwesomeIcons.twitter,
              size: 14.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(100.0)),
            child: Icon(
              FontAwesomeIcons.google,
              size: 14.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(100.0)),
            child: Icon(
              FontAwesomeIcons.share,
              size: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
