import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuildInExplicit(),
    );
  }
}

class BuildInExplicit extends StatefulWidget {
  const BuildInExplicit({super.key});

  @override
  State<BuildInExplicit> createState() => _BuildInExplicitState();
}

class _BuildInExplicitState extends State<BuildInExplicit>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    animation = Tween<double>(begin: 1.0, end: 1.5).animate(curvedAnimation);
    animationController.repeat(reverse: true);
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
        child: ScaleTransition(
            scale: animation,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage("assets/images/heart-Photoroom.png"),
              )
            ),
          ),
        )
      ),
    );
  }
}
