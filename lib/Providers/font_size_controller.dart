import 'package:flutter/material.dart';

class FontSizeController with ChangeNotifier {
  double _fontSize = 15;
  double get fontSize => _fontSize;
  void increment() {
    if (_fontSize <= 17) {
      _fontSize++;
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
    _fontSize = 15;
    notifyListeners();
  }
}
