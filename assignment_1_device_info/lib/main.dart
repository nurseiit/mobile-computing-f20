import 'dart:async';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

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

class DeviceInfoDisplay extends StatefulWidget {
  @override
  _DeviceInfoDisplayState createState() => _DeviceInfoDisplayState();
}

class _DeviceInfoDisplayState extends State<DeviceInfoDisplay> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initDeviceInfo();
  }

  Future<void> initDeviceInfo() async {
    final AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
    setState(() {
      _deviceData = <String, dynamic>{
        'Model': build.model,
        'Brand': build.brand,
        'Manufacturer': build.manufacturer,
        'Board': build.board,
        'Bootloader': build.bootloader,
        'Device': build.device,
        'Display': build.display,
        'Hardware': build.hardware,
        'Host': build.host,
        'ID': build.id,
        'Product': build.product
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      child: Table(
        children: _deviceData.keys
            .map(
              (property) => TableRow(
                children: [
                  Padding(
                    child: Text(property),
                    padding: const EdgeInsets.only(bottom: 10.0),
                  ),
                  Padding(
                    child: Text('${_deviceData[property]}'),
                    padding: const EdgeInsets.only(bottom: 10.0),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
