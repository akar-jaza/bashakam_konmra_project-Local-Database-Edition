import 'package:flutter/material.dart';

class FontSizeController with ChangeNotifier {
  double _fontSize = getDeviceType() == 'phone' ? 15 : 18;
  double get fontSize => _fontSize;
  void increment() {
    if (_fontSize <= 23) {
      if (getDeviceType() == "phone" && _fontSize <= 18) {
        _fontSize++;
      }
      if (getDeviceType() == "tablet") {
        _fontSize++;
      }
    }
    notifyListeners();
  }

  void decrement() {
    if (_fontSize >= 14) {
      _fontSize--;
    }
    notifyListeners();
  }

  void reset() {
    if (getDeviceType() == "phone") {
      _fontSize = 15;
    } else {
      _fontSize = 18;
    }
    notifyListeners();
  }
}

String getDeviceType() {
  final MediaQueryData data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.single);

  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}
