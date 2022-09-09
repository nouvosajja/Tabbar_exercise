import 'package:flutter/material.dart';
import 'package:tugas3/ListFootballPL.dart';
import 'package:tugas3/Profile.dart';
import 'package:tugas3/Twitter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample>with SingleTickerProviderStateMixin {
  
  late TabController _controller;
    int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.sports_soccer_outlined)),
    Tab(icon: Icon(FontAwesomeIcons.twitter),),
    Tab(icon: Icon(Icons.person_outlined)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 114, 114, 114),
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('Flutter'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ListFootballPL(),
            Twitter(),
            CardProfile()
          ],
        ),
      ),
    );
  }
}