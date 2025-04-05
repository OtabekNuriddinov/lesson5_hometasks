import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationOffset(),
    );
  }
}

class AnimationOffset extends StatefulWidget {
  const AnimationOffset({super.key});

  @override
  State<AnimationOffset> createState() => _AnimationOffsetState();
}

class _AnimationOffsetState extends State<AnimationOffset>
    with SingleTickerProviderStateMixin {
  
  late AnimationController animationController;
  late Animation<Offset> myAnimation;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut,
    );
    myAnimation = Tween<Offset>(
      begin: const Offset(-0.75, -0.75),
      end: const Offset(0.75, 0.75),
    ).animate(curvedAnimation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: myAnimation,
          child: const FlutterLogo(
            size: 150,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.forward();
        },
      ),
    );
  }
}
