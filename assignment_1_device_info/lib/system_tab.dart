import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class SystemTab extends StatefulWidget {
  @override
  _SystemTabState createState() => _SystemTabState();
}

class _SystemTabState extends State<SystemTab> {
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
        'androidId': build.androidId,
        'codename': build.version.codename,
        'baseOS': build.version.baseOS,
        'sdkInt': build.version.sdkInt,
        'securityPatch': build.version.securityPatch,
        'release': build.version.release,
        'previewSdkInt': build.version.previewSdkInt,
        'incremental': build.version.incremental,
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
