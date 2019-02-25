import 'package:flutter/material.dart';

class DropDownFilter extends StatefulWidget {
  DropDownFilter({Key key, this.widget});
  final Widget widget;
  @override
  _DropDownFilterState createState() => _DropDownFilterState();
}

class _DropDownFilterState extends State<DropDownFilter> with SingleTickerProviderStateMixin {
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
    // TODO: implement initState
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
    // controller.forward();
  }
  void ontap () {
    controller.reverse();
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(137, 188, 200, 1),
        title: Text('下拉筛选框'),
      ),
      body: Stack( //stack设置为overflow：visible之后，内部的元素中超出的部分就不能触发点击事件；所以尽量避免这种布局
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                color: Colors.yellow,
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Text('排序'),
                      Icon(Icons.keyboard_arrow_down,color: Colors.orange,)
                    ],
                  ),
                ),
                onPressed: () {
                  if(animation.status == AnimationStatus.completed) {
                    controller.reverse();
                  } else {
                    controller.forward();
                  }
                },
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.green,
                child: Text('data'),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Positioned(
                top: 50,
                child: 
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                  height: animation.value,
                  child: ListView(
                    children: List.generate(sorts.length, (i) {
                      return GestureDetector(
                        onTap: ontap,
                        child: Text(sorts[i])
                      );
                    }),
                  ),
                )
              ),
            ],
          )
        ],
      )
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}