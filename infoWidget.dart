// ignore: depend_on_referenced_packages
// ignore_for_file: use_key_in_widget_constructors, depend_on_referenced_packages, duplicate_ignore, file_names

import 'package:discountsstore_app/deviceInfo.dart';
import 'package:discountsstore_app/getDeviceType.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;

  const InfoWidget({required this.builder});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        var mediaQueryData = MediaQuery.of(context);
        var deviceInfo = DeviceInfo(
          orientation: mediaQueryData.orientation,
          deviceType: getDeviceType(mediaQueryData),
          screenWidth: mediaQueryData.size.width,
          screenHeight: mediaQueryData.size.height,
          localHeight: constrains.maxHeight,
          localWidth: constrains.maxWidth,
        );
        return builder(context, deviceInfo);
      },
    );
  }
}