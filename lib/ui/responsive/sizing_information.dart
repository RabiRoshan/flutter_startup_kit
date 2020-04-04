import 'package:flutter/widgets.dart';

class SizingInformation {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.deviceScreenType,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'DeviceScreenType:$deviceScreenType\nScreenSize:$screenSize\nLocalWidgetSize:$localWidgetSize';
  }
}

enum DeviceScreenType { Mobile, Tablet, Desktop }
