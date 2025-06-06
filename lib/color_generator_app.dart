import 'package:flutter/material.dart';
import 'package:test_task/views/home_view.dart';

class ColorGeneratorApp extends StatelessWidget {
  const ColorGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeView(),
    );
  }
}
