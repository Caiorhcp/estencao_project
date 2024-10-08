import 'package:flutter/material.dart';
import 'package:xotecariri/pages/home-page/app_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppNavigation(),
    );
  }
}
