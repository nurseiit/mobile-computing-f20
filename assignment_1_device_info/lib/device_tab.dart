import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class DeviceTab extends StatefulWidget {
  @override
  _DeviceTabState createState() => _DeviceTabState();
}

class _DeviceTabState extends State<DeviceTab> {
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