import 'package:flutter/material.dart';
import '../common/dropDownItem.dart';
import '../../model/filterButtonModel.dart';

List<String> lists = [
  '默认排序',
  '首付最低',
  '月供最低',
  '车价最低',
  '车价最高'
];

class OneDropPage extends StatefulWidget {
  @override
  _OneDropPageState createState() => _OneDropPageState();
}

class _OneDropPageState extends State<OneDropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OneDropPage'),
        backgroundColor: Color.fromRGBO(137, 188, 200, 1),
      ),
      body: Column(
        children: <Widget>[
          DropDownFilter(
            buttons: [
              FilterButtonModel(
                title: '排序',
                type: 'Row',
                contents: ['默认排序','首付最低','月供最低','车价最低','车价最高'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}