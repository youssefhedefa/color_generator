import 'package:flutter/material.dart';
import 'package:test_task/providers/color_generator_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ColorGeneratorProvider _generatorProvider;

  @override
  void initState() {
    _generatorProvider = ColorGeneratorProvider();
    _generatorProvider.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _generatorProvider.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _generatorProvider.generateRandomBackgroundColor();
        _generatorProvider.generateRandomTextColor();
      },
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          color: _generatorProvider.backgroundColor,
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: 30,
                color: _generatorProvider.textColor,
              ),
              child: const Text('Hello there'),
            ),
          ),
        ),
      ),
    );
  }
}
