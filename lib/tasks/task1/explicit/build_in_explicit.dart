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
  late Animation<Offset> _animation;
  late Animation<double> curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
        .animate(curvedAnimation);
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
      backgroundColor: Colors.white,
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ball.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
