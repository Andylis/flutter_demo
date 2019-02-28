import 'package:flutter/material.dart';
import 'pages/home.dart';
import './pages/animation/index.dart';
import './pages/animation/firstDemo.dart';
import './pages/animation/animatedWidget.dart';
import './pages/animation/oneDropPage.dart';
import './pages/animation/dropFiltersPage.dart';
import './pages/FoldAnim.dart';

void main() => runApp(MyApp());
GlobalKey _mainKey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _mainKey,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
      routes: {
        '/animation': (context) => AnimationPage(),
        '/animation/firstDemo': (context) => AnimationFirstDemo(),
        '/animation/AnimatedWidgetDemo': (context) => AnimatedWidgetDemo(),
        '/animation/oneDropPage': (context) => OneDropPage(),
        '/animation/dropFiltersPage': (context) => DropFiltersPage(),
        // '/animation/FoldAnim': (context) => FoldAnim()
      },
    );
  }
}