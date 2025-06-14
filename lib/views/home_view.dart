import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/providers/color_generator_provider.dart';
import 'package:test_task/utils/app_strings.dart';

/// The main application widget that sets up the MaterialApp and provides
class HomeView extends StatelessWidget {
  /// Creates an instance of [HomeView].
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorGeneratorProvider>(
      builder:
          (_, provider, _) => GestureDetector(
            onTap: () {
              provider.generateRandomBackgroundColor();
              provider.generateRandomTextColor();
            },
            child: Scaffold(
              body: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                color: provider.backgroundColor,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    style: TextStyle(fontSize: 30, color: provider.textColor),
                    child: const Text(AppStrings.helloThere),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
