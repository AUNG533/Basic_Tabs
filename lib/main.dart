// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({required this.title, required this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Car', icon: Icons.directions_car),
  Choice(title: 'Bicycle', icon: Icons.directions_bike),
  Choice(title: 'Boat', icon: Icons.directions_boat),
  Choice(title: 'Bus', icon: Icons.directions_bus),
  Choice(title: 'Train', icon: Icons.directions_railway),
  Choice(title: 'Walk', icon: Icons.directions_walk)
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final appTitle = "AppBar";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
            appBar: AppBar(
          title: Text(appTitle),
          bottom: TabBar(
            isScrollable: true,
              tabs: choices.map((Choice choice) {
            return Tab(
              // text: choice.title,
              // icon: Icon(choice.icon),
              child: Row(
                children: [Icon(choice.icon),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(choice.title),
                ),
                ],
              ),
            );
          }).toList()),
        ),),
      ),
    );
  }
}
