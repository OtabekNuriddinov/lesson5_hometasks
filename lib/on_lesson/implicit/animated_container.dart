import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimContainer(),
    );
  }
}

class AnimContainer extends StatefulWidget {
  const AnimContainer({super.key});

  @override
  State<AnimContainer> createState() => _AnimContainerState();
}

class _AnimContainerState extends State<AnimContainer> {
  double dimension = 100;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.bounceIn,
          height: isPressed ? dimension = 300:100,
          width: isPressed ? dimension = 300:100,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });
      }),
    );
  }
}
