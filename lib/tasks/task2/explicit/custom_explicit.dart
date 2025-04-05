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
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );

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
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child){
              return Transform.scale(
                scale: animation.value,
                child: child,
              );
            },
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
        ),
      ),
    );
  }
}
