import 'package:flutter/material.dart';

import 'package:assignment_device_info/device_tab.dart';

void main() {
  runApp(DeviceInfo());
}

class DeviceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 1',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Device Info'),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'device'.toUpperCase()),
              Tab(text: 'system'.toUpperCase()),
              Tab(text: 'hardware'.toUpperCase()),
            ],
          ),
          title: Text(title),
        ),
        body: TabBarView(
          children: [
            DeviceTab(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
