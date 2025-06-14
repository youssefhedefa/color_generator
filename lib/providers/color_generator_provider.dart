import 'dart:math';

import 'package:flutter/material.dart';

/// A provider class that generates random colors for background and text.
class ColorGeneratorProvider extends ChangeNotifier {
  final Random _random = Random();
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;

  /// The maximum value for RGB color components.
  int maxColorValue = 256;

  /// The threshold for determining text color based on background luminance.
  double opacitySeparatorValue = 0.5;

  /// Gets the current background color.
  Color get backgroundColor => _backgroundColor;

  /// Gets the current text color.
  Color get textColor => _textColor;

  /// Generates a random background color and updates the state.
  void generateRandomBackgroundColor() {
    _backgroundColor = Color.fromRGBO(
      _generateRandomNumber(),
      _generateRandomNumber(),
      _generateRandomNumber(),
      _generateOpacity(),
    );
    notifyListeners();
  }

  int _generateRandomNumber() {
    return _random.nextInt(maxColorValue);
  }

  double _generateOpacity() {
    return _random.nextDouble();
  }

  /// Generates a text color based on the current background color's luminance.
  void generateRandomTextColor() {
    // Calculate the luminance of the background color
    _textColor =
        _backgroundColor.computeLuminance() < opacitySeparatorValue
            ? Colors.white
            : Colors.black;
    notifyListeners();
  }
}
