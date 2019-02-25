import 'package:flutter/material.dart';
import 'pages/home.dart';
import './pages/animation/index.dart';
import './pages/animation/firstDemo.dart';
import './pages/animation/animatedWidget.dart';
import './pages/animation/dropDownFilter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
      routes: {
        '/animation': (context) => AnimationPage(),
        '/animation/firstDemo': (context) => AnimationFirstDemo(),
        '/animation/AnimatedWidgetDemo': (context) => AnimatedWidgetDemo(),
        '/animation/downDropFilter': (context) => DropDownFilter()
      },
    );
  }
}