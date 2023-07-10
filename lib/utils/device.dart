import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Device {
  static getRatio(int value) {
    int uiwidth = value is int ? value : 750;
    return ScreenUtil().screenWidth / uiwidth;
  }

  static getRpx(double value) {
    return value * getRatio(750);
  }

  static getBottomPadding() {
    return ScreenUtil().screenHeight;
  }

  static getTopPadding() {
    return ScreenUtil().screenHeight;
  }

  static getWidth() {
    return ScreenUtil().screenWidth;
  }

  static Platform platform = Platform();
}
