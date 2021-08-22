import 'package:flutter/cupertino.dart';

class Routes {
  static final Router router = new Router(
    routerDelegate: null,
  );
  static const ROOT = '/';
  static Routes _instance;

  static Routes get instance {
    if (_instance == null) {
      _instance = new Routes();
    }
    return _instance;
  }
}
