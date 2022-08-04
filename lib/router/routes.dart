import 'package:flutter/cupertino.dart';

class Routes {
  static final Router router = Router(
    routerDelegate: null,
  );
  static const ROOT = '/';
  static Routes _instance;

  static Routes get instance {
    if (_instance == null) {
      _instance = Routes();
    }
    return _instance;
  }
}
