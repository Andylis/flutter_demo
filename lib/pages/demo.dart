import 'package:flutter/material.dart';

import '../model/routeModel.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<RouteModel> grids = [
    new RouteModel('Animation', '/animation'),
    new RouteModel('Animation', 'vvv'),
    new RouteModel('Animation', 'vvv'),
    new RouteModel('Animation', 'vvv')
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(grids.length, (i) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, grids[i].route);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1)
            ),
            child: Text(grids[i].name, style: TextStyle(
              fontSize: 16,
              color: Color(0xff333333)
            ),),
          )
        );
      }),
    );
  }
}