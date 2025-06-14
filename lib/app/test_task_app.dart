import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/providers/color_generator_provider.dart';
import 'package:test_task/utils/app_strings.dart';
import 'package:test_task/views/home_view.dart';


/// The main application widget that sets up the MaterialApp and provides
class TestTaskApp extends StatelessWidget {
  /// Creates an instance of [TestTaskApp].
  const TestTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider(
        create: (_) => ColorGeneratorProvider(),
        child: const HomeView(),
      ),
    );
  }
}
