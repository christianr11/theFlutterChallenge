import 'package:flutter/material.dart';
import 'package:flutterChallenge/models/post.dart';

class NewsFeedFooterWidget extends StatefulWidget {
  final Articles post;

  NewsFeedFooterWidget({this.post});
  @override
  _NewsFeedFooterState createState() => _NewsFeedFooterState();
}

class _NewsFeedFooterState extends State<NewsFeedFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              'Featured Content',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 50.0,
              child: Center(
                child: Text(
                  '${widget.post.content}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
