import 'dart:math';

import 'package:flutter/material.dart';

class ColorGeneratorProvider extends ChangeNotifier{
  final Random _random = Random();
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;

  Color get backgroundColor => _backgroundColor;
  Color get textColor => _textColor;

  void generateRandomBackgroundColor() {
    _backgroundColor = Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
    notifyListeners();
  }

  void generateRandomTextColor() {
    if (_backgroundColor.computeLuminance() < 0.5) {
      _textColor = Colors.white;
    } else {
      _textColor = Colors.black;
    }
    notifyListeners();
  }

}