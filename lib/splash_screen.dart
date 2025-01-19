import 'package:flutter/material.dart';
import 'package:word_search_app/grid_input_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GridInputScreen()),
      );
    });

    return Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}