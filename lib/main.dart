import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ShaderMask(
          blendMode: BlendMode.saturation,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.black.withOpacity(0.8)])
                .createShader(bounds);
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/wolf.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
