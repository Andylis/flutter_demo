import 'package:flutter/material.dart';
import '../../model/routeModel.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  List<RouteModel> animationList = [
    RouteModel('小例子', '/animation/firstDemo'),
    RouteModel('AnimatedWidgetDemo', '/animation/AnimatedWidgetDemo'),
    RouteModel('downDropFilter', '/animation/downDropFilter'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(137, 188, 200, 1),
        title: Text('Animation'),
      ),
      body: ListView(
        children: List.generate(animationList.length, (i) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 15,top: 10, bottom: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: Color(0xffdddddd)))
              ),
              child: Text(animationList[i].name,style: TextStyle(fontSize: 18),)
            ),
            onTap: () {
              Navigator.pushNamed(context, animationList[i].route);
            },
          );
        }),
      )
    );
  }
}