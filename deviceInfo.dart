// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:discountsstore_app/deviceType.dart';
import 'package:flutter/cupertino.dart';


class DeviceInfo {
  final Orientation orientation;
  final DeviceType deviceType;
  final double screenWidth;
  final double screenHeight;
  final double localWidth;
  final double localHeight;

  DeviceInfo(
      {required this.orientation,
     required this.deviceType,
     required this.screenWidth,
     required this.screenHeight,
     required this.localWidth,
     required this.localHeight});
}