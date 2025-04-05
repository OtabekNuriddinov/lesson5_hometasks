import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LAnimatedBuilder(),
    );
  }
}

class LAnimatedBuilder extends StatefulWidget {
  const LAnimatedBuilder({super.key});

  @override
  State<LAnimatedBuilder> createState() => _LAnimatedBuilderState();
}

class _LAnimatedBuilderState extends State<LAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(animationController);
    animationController.forward();
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
          builder: (context, child) {
            return SizedBox(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
