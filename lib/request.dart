import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class Request extends StatefulWidget {
  Request({Key key}): super(key: key);

  @override
  _request createState() => new _request();
}

class _request extends State<Request> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            // new Text('$_ipAddress.'),
            // spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}

_getIPAddress() async {
    var url = 'https://cheyixiao.autoforce.net/v3/saler/brand/series?v=712286543&Cyx_token=X0rJYZueMZ2H&Cyx_saler=62599&Cyx_ref=0&brand_id=2';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        String str = await response.transform(utf8.decoder).join();
        var data = json.decode(str);
        result = data['results'];
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }