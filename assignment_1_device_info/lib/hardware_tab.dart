import 'package:flutter/material.dart';
import 'package:system_info/system_info.dart';

class HardwareTab extends StatelessWidget {
  static const int MEGABYTE = 1024 * 1024;

  final Map<String, dynamic> _deviceData = <String, dynamic>{
    'Kernel architecture': SysInfo.kernelArchitecture,
    'Kernel bitness': SysInfo.kernelBitness,
    'Kernel name': SysInfo.kernelName,
    'Kernel version': SysInfo.kernelVersion,
    'Operating system name': SysInfo.operatingSystemName,
    'Operating system version': SysInfo.operatingSystemVersion,
    'User directory': SysInfo.userDirectory,
    'User id': SysInfo.userId,
    'User name': SysInfo.userName,
    'User space bitness': SysInfo.userSpaceBitness,
    'Total physical memory':
        '${SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE} MB',
    'Free physical memory': '${SysInfo.getFreePhysicalMemory() ~/ MEGABYTE} MB',
    'Total virtual memory': '${SysInfo.getTotalVirtualMemory() ~/ MEGABYTE} MB',
    'Free virtual memory': '${SysInfo.getFreeVirtualMemory() ~/ MEGABYTE} MB',
    'Virtual memory size': '${SysInfo.getVirtualMemorySize() ~/ MEGABYTE} MB',
  };

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
