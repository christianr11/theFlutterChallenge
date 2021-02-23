import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterChallenge/models/post.dart';
import 'package:flutterChallenge/ui/pages/newsfeed/newsfeed_info.dart';
import 'package:flutterChallenge/ui/widgets/loading_widget.dart';
import 'package:flutterChallenge/ui/widgets/newsfeed_widget.dart';
import 'package:http/http.dart' as http;

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  Future<Post> post;

  Future<Post> fetchPost() async {
    var response = await http.get(
        "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=93afe7cdf99644d99f05bddbec4ed118");
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Network Error');
    }
  }

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Newsfeed"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: FutureBuilder<Post>(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(15.0),
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsFeedInfo(
                                post: snapshot.data.articles[index])));
                  },
                  child: NewsFeedWidget(
                    post: snapshot.data.articles[index],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          }
          return Center(child: LoadingWidget());
        },
      ),
    );
  }
}
