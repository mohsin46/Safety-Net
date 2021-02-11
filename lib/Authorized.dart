import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_net/Map.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'HomePage.dart';
import 'Learn.dart';
import 'Profile.dart';
import 'SelfDefence.dart';

class Authorized extends StatefulWidget {
  @override
  _AuthorizedState createState() => _AuthorizedState();
}

class _AuthorizedState extends State<Authorized> {
  int pageIndex = 0;
  List<StatefulWidget> pages = [
    MyHomePage(),
    Learn(),
    SelfDefence(),
    MyMap(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/elegant-pink.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Safety Net'),
        //   backgroundColor: Colors.pinkAccent,
        // ),
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  Widget BottomNavBar() {
    return TitledBottomNavigationBar(
      currentIndex: pageIndex,
      reverse: true,
      onTap: (index) {
        print("Selected index: $index");
        setState(() {
          pageIndex = index;
        });
      },
      items: [
        TitledNavigationBarItem(
            title: Text('Alert'), icon: FontAwesomeIcons.exclamationCircle),
        // TitledNavigationBarItem(
        //     title: Text('Safe Place'), icon: FontAwesomeIcons.running),
        TitledNavigationBarItem(
            title: Text('Learn'), icon: Icons.self_improvement),
        TitledNavigationBarItem(
            title: Text('Self Defence'), icon: Icons.sports_kabaddi),
        TitledNavigationBarItem(title: Text('Map'), icon: Icons.map_outlined),
        TitledNavigationBarItem(
            title: Text('Profile'), icon: Icons.person_outline),
      ],
    );
  }
}
