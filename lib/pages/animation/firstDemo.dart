import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationFirstDemo extends StatefulWidget {
  @override
  _AnimationFirstDemoState createState() => _AnimationFirstDemoState();
}

class _AnimationFirstDemoState extends State<AnimationFirstDemo> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  List<String> sorts = [
    '默认排序',
    '首付最低',
    '月供最低',
    '车价最低',
    '车价最高'
  ];

  initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(milliseconds: 300), 
      vsync: this
    );

    animation = new Tween(begin: 0.0, end: 200.0).animate(controller)
    ..addListener(() {
      //这行如果不写，没有动画效果
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(137, 188, 200, 1),
        title: Text('demo1---渲染动画'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: animation.value,
            width: 300,
            child: ListView(
              children: List.generate(sorts.length, (i) {
                return GestureDetector(
                  child: Text(sorts[i]),
                  onTap: () {
                    controller.reverse();
                  },
                );
              }),
            )
          ),
          FlatButton(
            child: Text('缩回'),
            onPressed: () {
              controller.reverse();
            },
          ),
          FlatButton(
            child: Text('展开'),
            onPressed: () {
              controller.forward();
            },
          ),
        ],
      )
      
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}