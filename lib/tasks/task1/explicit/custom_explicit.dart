import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomExplicit(),
    );
  }
}

class CustomExplicit extends StatefulWidget {
  const CustomExplicit({super.key});

  @override
  State<CustomExplicit> createState() => _CustomExplicitState();
}

class _CustomExplicitState extends State<CustomExplicit>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
        .animate(curvedAnimation);
    animationController.repeat(reverse: true);

  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ball.jpg"),
              ),
            ),
          ),
          builder: (context, child) {
            return Transform.translate(
                offset: animation.value * 100,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
