import 'package:collaps_sidebar_and_nav_draver/theme.dart';
import 'package:flutter/material.dart';

import 'collapsing_navitaion_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom navigation drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom navigation drawer'),
        backgroundColor: drawerBackgroundColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          CollapsingNavigationDrawer(),
        ],
      ),
    );
  }
}
