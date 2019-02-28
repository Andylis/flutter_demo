import 'package:flutter/material.dart';
import '../common/dropDownItem.dart';
import '../../model/filterButtonModel.dart';

class DropFiltersPage extends StatefulWidget {
  @override
  _DropFiltersPageState createState() => _DropFiltersPageState();
}

class _DropFiltersPageState extends State<DropFiltersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropFiltersPage'),
        backgroundColor: Color.fromRGBO(137, 188, 200, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DropDownFilter(
            buttons: [
              FilterButtonModel(
                title: '排序',
                type: 'Row',
                contents: ['默认排序','首付最低','月供最低','车价最低','车价最高'],
              ),
              FilterButtonModel(
                title: '排序',
                type: 'Column',
                contents: ['默认排序1111','首付最低','月供最低','车价最低','车价最高'],
              ),
              FilterButtonModel(
                title: '排序',
                callback: () {
                  Navigator.pushNamed(context, '/animation/firstDemo');
                }
              )
            ],
          ),
          
        ]
      ),
    );
  }
}