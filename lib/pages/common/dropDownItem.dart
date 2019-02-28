import 'package:flutter/material.dart';
import '../../model/filterButtonModel.dart';


class DropDownFilter extends StatefulWidget {
  DropDownFilter({Key key, this.otherWidget, this.type, this.buttons});
  final Widget otherWidget;//除了筛选按钮部分Widget
  final String type;//类型：'Column','Row'
  final List<FilterButtonModel> buttons; //按钮数组 数据类型FilterButtonModel

  @override
  _DropDownFilterState createState() => _DropDownFilterState();
}

class _DropDownFilterState extends State<DropDownFilter> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double innerHeight = 150.0;
  FilterButtonModel curButton;

  initState() {
    // TODO: implement initState
    super.initState();
    //初始化下拉列表
    curButton = widget.buttons[0];

    controller = new AnimationController(
      duration: const Duration(milliseconds: 200), 
      vsync: this
    );

    animation = new Tween(begin: 0.0, end: innerHeight).animate(controller)
    ..addListener(() {
      //这行如果不写，没有动画效果
      setState(() {
      });
    });
    // controller.forward();
  }

  void ontap () {
    controller.reverse();
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
      child: 
      Stack( //stack设置为overflow：visible之后，内部的元素中超出的部分就不能触发点击事件；所以尽量避免这种布局
        children: <Widget>[
          Column(
            children: <Widget>[
              _button(),
              // widget
            ],
          ),
          _contentList(curButton)
        ],
      )
    );
  }

  //筛选按钮
  Widget _button() {
    return Row(
      children: List.generate(widget.buttons.length, (i) {
        return FlatButton(
          padding: EdgeInsets.only(left: 10),
          color: Colors.yellow,
          child: SizedBox(
            height: 50,
            width: 100,
            child: Row(
              children: <Widget>[
                Text(curButton.title),
                Icon(Icons.keyboard_arrow_down,color: Colors.orange,)
              ],
            ),
          ),
          onPressed: () {
            setState(() {
              curButton = widget.buttons[i];
            });
            if(curButton.callback == null) {
              if(animation.status == AnimationStatus.completed) {
                controller.reverse();
              } else {
                controller.forward();
              }
            } else {
              curButton.callback();
            }
            
          },
        );
      }),
    );
    
  }

  //筛选弹出的下拉列表
  Widget _contentList(FilterButtonModel lists) {
    if(lists.contents != null && lists.contents.length > 0 ) {
      return Positioned(
          height: animation.value,
          width:  MediaQuery.of(context).size.width,
          top: 50,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            height: innerHeight,
            child: _innerConList(lists)
          )
      );
    } else {
      return Container(height: 0,);
    }
  }
  
  Widget _innerConList(FilterButtonModel lists) {
    if(lists.type == 'Row') {
      setState(() {
        innerHeight = 150.0;
      });
      
      return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Wrap(
          alignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          runSpacing: 15,
          children: List.generate(lists.contents.length, (i) {
            return GestureDetector(
              onTap: ontap,
              child: Container(
                width: (MediaQuery.of(context).size.width - 20) / 3,
                child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(216,216,216,0.3),
                  ),
                  child: Text(lists.contents[i]),
                )
              )
            ); 
          }),
        )
      );
    } else {
      setState(() {
        innerHeight = 250.0;
      });
      return ListView(
        children: List.generate(lists.contents.length, (i) {
          return GestureDetector(
            onTap: ontap,
            child: Text(lists.contents[i])
          );
        }),
      );
    }
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
