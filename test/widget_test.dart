import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/color_generator_app.dart';

void main() {
  group('ColorGeneratorApp Tests', () {
    testWidgets('Background and text colors change on tap', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ColorGeneratorApp());

      // Verify the initial state of the app.
      final initialContainer = tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      final initialBackgroundColor = (initialContainer.decoration as BoxDecoration).color;

      // Simulate a tap on the GestureDetector.
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      // Verify that the background color has changed.
      final newContainer = tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      final newBackgroundColor = (newContainer.decoration as BoxDecoration).color;
      expect(newBackgroundColor, isNot(equals(initialBackgroundColor)));

    });
  });
}