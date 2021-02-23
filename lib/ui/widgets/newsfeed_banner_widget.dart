import 'package:flutter/material.dart';
import 'package:flutterChallenge/models/post.dart';

class NewsFeedBannerWidget extends StatefulWidget {
  final Articles post;

  NewsFeedBannerWidget({this.post});
  @override
  _NewsFeedBannerState createState() => _NewsFeedBannerState();
}

class _NewsFeedBannerState extends State<NewsFeedBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400.0,
          child: Stack(
            children: [
              Container(
                height: 400.0,
                child: Hero(
                  tag: widget.post.title,
                  child: Image.network(
                    widget.post.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.post.title}.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '${widget.post.author}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [],
        ),
      ],
    );
  }
}
