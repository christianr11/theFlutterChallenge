import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterChallenge/ui/pages/calculator/calculator.dart';
import 'package:flutterChallenge/ui/pages/home/home.dart';
import 'package:flutterChallenge/ui/pages/newsfeed/newsfeed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigation extends StatefulWidget {
  MainNavigation({this.newIndex});
  final int newIndex;
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final pages = [
    Home(),
    NewsFeed(),
    Calculator(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          Home(),
          NewsFeed(),
          Calculator(),
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueGrey,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.globeAsia,
              size: 20,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(
                  FontAwesomeIcons.rssSquare,
                  size: 20,
                ),
              ],
            ),
            title: Text('Newsfeed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.calculator,
              size: 20,
            ),
            title: Text('Calculator'),
          ),
        ],
      ),
    );
  }
}
