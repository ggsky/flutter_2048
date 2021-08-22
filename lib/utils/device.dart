import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Device {
  static getRatio(int value) {
    int uiwidth = value is int ? value : 750;
    return ScreenUtil().uiSize.width / uiwidth;
  }

  static getRpx(double value) {
    return value * getRatio(750);
  }

  static getBottomPadding() {
    return ScreenUtil().uiSize.height;
  }

  static getTopPadding() {
    return ScreenUtil().uiSize.height;
  }

  static getWidth() {
    return ScreenUtil().uiSize.width;
  }

  static Platform platform = Platform();
}
