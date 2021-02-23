import 'package:flutter/material.dart';
import 'package:flutterChallenge/models/post.dart';

class NewsFeedWidget extends StatefulWidget {
  final Articles post;

  NewsFeedWidget({this.post});
  @override
  _NewsFeedWidgetState createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            child: Hero(
              tag: widget.post.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "${widget.post.urlToImage}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 105.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 140.0,
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Text(
                    '${widget.post.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 140.0,
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 2.0),
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          "${widget.post.author}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      Text(
                        "${widget.post.publishedAt}",
                        style: TextStyle(fontSize: 12.0, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
