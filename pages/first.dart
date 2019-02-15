import 'package:flutter/material.dart';
import '../lib/data.dart';
// import 'dart:io';
class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: '自营车源'),
  Choice(title: '寻车'),
];


class CarItem {
  const CarItem({ this.title, this.icon, this.price, this.procedure, this.labels});
  final String title;
  final IconData icon;
  final String price;
  final String procedure;
  final List<String> labels;
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            // DropdownBtn(),
            DropdownBtn(),
            CarList(),
            // RaisedButton(
            //   child: Text('second Screen'),
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/second');
            //     // Navigate to second screen when tapped!
            //   },
            // ),
        ],
      ),
    );
  }
}

class DropdownBtn extends StatefulWidget {
  // static const 

  @override 
  _DropdownButtonState createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownBtn> {
  String dropdownValue = 'Four';

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            trailing: DropdownButton <String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'One', 'Two', 'Free', 'Four', 'Can', 'I', 'Have', 'A', 'Little',
                'Bit', 'More', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'
                ]
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
              .toList(),
             ),
          ),
        ],
      ),
    );
  }
}


class CarList extends StatelessWidget {
  const CarList({Key key, this.car }) : super(key: key);

  final CarItem car;
  // String LabelItem labelItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(8.0),
        children: cars.map<Widget>((CarItem car) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: carListItem(car, context),
          );
        }).toList(),
      ),
    );
      
  }

  Widget carListItem(carItem, context) {
    return GestureDetector(
      onTapDown: (e) {
        print(e);
        Navigator.pushNamed(context, '/second');
      },
      child: Container(
        // height: 100,
        // width: 300,
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(carItem.title,style: TextStyle(fontSize: 18, color: Colors.black),),
                Text(carItem.price + '万', style: TextStyle(fontSize: 18, color: Colors.red[900]),),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(carItem.procedure),
              )
                
            ],),
            // Row(
            //   children: carItem.labels.map<Widget>(carItem.labels)[
            //     Text(carItem.labels) 
            //   ],
            // )
          ],
        )
      ),
    );
  }
}