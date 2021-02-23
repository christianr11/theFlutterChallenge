import 'package:flutter/material.dart';
import 'package:flutterChallenge/models/post.dart';
import 'package:flutterChallenge/ui/widgets/newsfeed_banner_widget.dart';
import 'package:flutterChallenge/ui/widgets/newsfeed_footer_widget.dart';
import 'package:flutterChallenge/ui/widgets/social_icons.dart';

class NewsFeedInfo extends StatefulWidget {
  final Articles post;

  NewsFeedInfo({this.post});
  @override
  _NewsFeedInfoState createState() => _NewsFeedInfoState();
}

class _NewsFeedInfoState extends State<NewsFeedInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          NewsFeedBannerWidget(post: widget.post),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SocialIconsWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${widget.post.name}',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  child: Text(
                    '${widget.post.description}',
                    textAlign: TextAlign.justify,
                    // style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                NewsFeedFooterWidget(
                  post: widget.post,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
