// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'home.dart';
import 'first.dart';
import 'second.dart';

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        // '/' : (context) => SecondScreen(),
        '/second': (context) => SecondScreen(),
        '/first': (context) => ChoiceCard()
      },
      
      theme: ThemeData(
        
      ),
    );
  }
}

void main() {
  runApp(TabbedAppBarSample());
}
