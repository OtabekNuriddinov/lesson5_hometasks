import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ComponentStudy(),
    );
  }
}

class ComponentStudy extends StatefulWidget {
  const ComponentStudy({super.key});

  @override
  State<ComponentStudy> createState() => _ComponentStudyState();
}

class _ComponentStudyState extends State<ComponentStudy>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );

    animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
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
        child: AnimatedJumpItem(
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
        ),
      ),
    );
  }
}

class AnimatedJumpItem extends AnimatedWidget {
  final Widget child;

  const AnimatedJumpItem(
      {super.key, required this.child, required Animation<Offset> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Offset>;
    return Transform.translate(
      offset: animation.value * 100,
      child: child,
    );
  }
}
