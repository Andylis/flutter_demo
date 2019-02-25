import 'package:flutter/material.dart';
import './demo.dart';
import './other.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<String> bottomBars = ['Demo', '其他'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 44),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            DemoPage(),
            OtherPage()
          ],
        ),
      ),
      bottomNavigationBar: TabBar(
        labelColor: Color(0xffD5001C),
        unselectedLabelColor: Color(0xffbbbbbb),
        indicatorColor: Color(0xffD5001C),
        controller: _tabController,
        tabs: List.generate(bottomBars.length, (i) {
          return Tab(
            text: bottomBars[i],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

