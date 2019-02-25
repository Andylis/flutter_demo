import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedImg extends AnimatedWidget {
  AnimatedImg({Key key, Animation<double> animation}): super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Center(
      child: Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class AnimatedWidgetDemo extends StatefulWidget {
  @override
  _AnimatedWidgetDemoState createState() => _AnimatedWidgetDemoState();
}

class _AnimatedWidgetDemoState extends State<AnimatedWidgetDemo> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      duration: const Duration(milliseconds: 2000), 
      vsync: this
    );
    animation = Tween(begin: 50.0, end: 200.0).animate(controller);
    //监听动画的状态
    animation.addStatusListener((state) {
      if(state == AnimationStatus.completed) {
        controller.reverse();
      } else if(state == AnimationStatus.dismissed) {
        controller.forward();
      }
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
      body: Container(
        child: AnimatedImg(animation: animation),
      ),
    );
  }
  @override
    void dispose() {
      controller.dispose();
      // TODO: implement dispose
      super.dispose();
    }
}