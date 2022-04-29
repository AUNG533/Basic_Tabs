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
        // initialIndex: 2,
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Center(
                child: Text(choice.title),
              );
            }).toList(),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                  isScrollable: true,
                  onTap: (index) {
                    print("index: ${index}");
                  },
                  tabs: choices.map((Choice choice) {
                    return Tab(
                      text: choice.title,
                      icon: Icon(choice.icon),
                    );
                  }).toList()),
            ),
          ),
        ),
      ),
    );
  }
}
