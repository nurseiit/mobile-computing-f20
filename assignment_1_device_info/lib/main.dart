import 'package:flutter/material.dart';

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
            DeviceInfoDisplay(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}

class DeviceInfoDisplay extends StatelessWidget {
  final List<String> categories = [
    'Model',
    'Brand',
    'Manufacturer',
    'Board',
    'Bootloader',
    'Device',
    'Display',
    'Hardware',
    'Host',
    'ID',
    'Product'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
      child: Table(
        children: categories
            .map(
              (category) => TableRow(children: [
                Padding(
                  child: Text(category),
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
                Padding(
                  child: Text('kjkjskdjkjsdkjsdjkj'),
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }
}
