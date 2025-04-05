import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ComponentAnimation(),
    );
  }
}

class ComponentAnimation extends StatefulWidget {
  const ComponentAnimation({super.key});

  @override
  State<ComponentAnimation> createState() => _ComponentAnimationState();
}

class _ComponentAnimationState extends State<ComponentAnimation> with SingleTickerProviderStateMixin{

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
        child: AnimatedFlutterLogo(
            animation: animation,
            child: const FlutterLogo(),
        ),
      ),
    );
  }
}

class AnimatedFlutterLogo extends AnimatedWidget {
  final Widget child;

  const AnimatedFlutterLogo(
      {super.key, required Animation<double> animation, required this.child})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
   final animation = listenable as Animation<double>;
   return SizedBox(
     height: animation.value,
     width: animation.value,
     child: child,
   );
  }
}
