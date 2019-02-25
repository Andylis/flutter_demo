import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../lib/chipDemo.dart';
import '../lib/expandControl.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(new SecondScreen());
}

var carDetailData = 'Unknown';

Future<Car> fetchPost() async {
  print('Post Start!!');
  final response = await http.get(
      'https://cheyixiao.autoforce.net/v5E/sms/sell/detail?Cyx_token=HRwfz4eeMxSX&Cyx_saler=4548&Cyx_ref=1&web_version=010000&sell_id=143313');

  if (response.statusCode == 200) {
    print(json.decode(response.body));
    // If server returns an OK response, parse the JSON
    return Car.fromJson(json.decode(response.body));
  } else {
    print('Failed to load post');
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class Car {
  final String company;
  final String logistics;
  final Map<String, dynamic> carInfo;

  Car({this.company, this.logistics, this.carInfo});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      company: json['results']['company'],
      logistics: json['results']['logistics'],
      carInfo: json['results']
    );
  }
}

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);
  @override
  _SecondScreen createState() => new _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('车源详情'),
      ),
      body: new MyHomePage(car: fetchPost()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Future<Car> car;

  MyHomePage({Key key, this.car}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: FutureBuilder<Car>(
          future: widget.car,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CarDetailTop(carInfo: snapshot.data.carInfo);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}


class CarDetailTop extends StatelessWidget {
  const CarDetailTop({Key key, this.carInfo});
  final Map<String, dynamic> carInfo;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: ExpansionPanelsDemo(),
      )
      // ListView(
      //   children: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         Text(carInfo['spec'],style: TextStyle(fontSize: 20, color: Colors.black),),
      //         Text(carInfo['guide_price'] + '万',style: TextStyle(fontSize: 20, color: Colors.red[900]),)
      //       ],
      //     ),
      //     Row(
      //       mainAxisSize: MainAxisSize.max,
      //       children: <Widget>[
      //         carTipsItem(carInfo['car_format']),
      //         carTipsItem(carInfo['outer_color'] + '/' + carInfo['inner_color']),
      //         carTipsItem('车在' + carInfo['car_location']),
      //         carTipsItem('售' + carInfo['sell_area']),
      //         carTipsItem(carInfo['logistics']),
      //         carTipsItem('库存' + carInfo['stock'].toString()),
      //       ],
      //     )
      //   ],
      // )
    );
  }

  Widget carTipsItem (String text) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(text,style: TextStyle(color: Colors.black38),),
    );
  }
}



